<?php # $Id$

if (IN_serendipity !== true) {
    die ("Don't hack!");
}

use Serendipity\Version\Version;

global $serendipity;

$user = serendipity_fetchAuthor($serendipity['authorid']);
// chrome-compatible, from Oliver Gassner, adapted from TextPattern. Hi guys, keep it up. :-)
$bookmarklet = "javascript:var%20d=document,w=window,e=w.getSelection,k=d.getSelection,x=d.selection,s=(e?e():(k)?k():(x?x.createRange().text:0)),f='" . $serendipity['baseURL'] . "',l=d.location,e=encodeURIComponent,p='serendipity_admin.php?serendipity[adminModule]=entries&serendipity[adminAction]=new&serendipity[title]='+e(d.title)+'&serendipity[body]='+e(s)+'&serendipity[url]='+location.href,u=f+p;a=function(){%20%20if(!w.open(u,'t','toolbar=0,resizable=1,scrollbars=1,status=1,width=800,height=800'))%20%20%20%20l.href=u;};if(/Firefox/.test(navigator.userAgent))%20%20setTimeout(a,0);else%20%20a();void(0)";

$data = array();
$data['bookmarklet'] = $bookmarklet;
$data['username'] = $user[0]['realname'];

$output = array();
serendipity_plugin_api::hook_event('backend_frontpage_display', $output);
$data['backend_frontpage_display'] = $output['more'];

$data['curVersion'] = serendipity_getCurrentVersion();
$data['usedVersion'] = Version::VERSION;
$data['update'] = version_compare($data['usedVersion'], $data['curVersion'], '<');


$comments = serendipity_db_query("SELECT c.*, e.title FROM {$serendipity['dbPrefix']}comments c
                                    LEFT JOIN {$serendipity['dbPrefix']}entries e ON (e.id = c.entry_id)
                                    ORDER BY c.id DESC LIMIT 5");
if (count($comments) > 1) {
    foreach ($comments as &$comment) {
        $entrylink = serendipity_archiveURL($comment['entry_id'], 'comments', 'serendipityHTTPPath', true) . '#c' . $comment['id'];
        $comment['entrylink'] = $entrylink;
    }
}

$data['comments'] = $comments;

$entries = serendipity_fetchEntries(
                     false,
                     false,
                     5,
                     true,
                     false,
                     'timestamp DESC',
                     'e.timestamp >= ' . serendipity_serverOffsetHour()
                   );

$entriesAmount = count($entries);
if ($entriesAmount < 5) {
    // there is still space for drafts
    $drafts = serendipity_fetchEntries(
                     false,
                     false,
                     5- $entriesAmount,
                     true,
                     false,
                     'timestamp DESC',
                     'isdraft = "true" AND e.timestamp <=  ' . serendipity_serverOffsetHour() 
                   );
    if (is_array($entries) && is_array($drafts)) {
        $entries = array_merge($entries, $drafts);
    } else {
        if (is_array($drafts)) {
            // $entries is not an array, thus empty
            $entries = $drafts;
        }
    }
}

$data['entries'] = $entries;

$data['token'] = serendipity_setFormToken('url');

echo serendipity_smarty_show('admin/overview.inc.tpl', $data);

/* vim: set sts=4 ts=4 expandtab : */
