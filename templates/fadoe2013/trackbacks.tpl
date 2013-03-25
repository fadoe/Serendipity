
{foreach from=$trackbacks item=trackback}

    <div class="media" id="c{$trackback.id}">

        <div class="media-body">

            <h4 class="media-headline"><a href="{$trackback.url|@strip_tags}" {'blank'|@xhtml_target}>{$trackback.author|@default:$CONST.ANONYMOUS}</a> {$CONST.ON} {$trackback.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}: {$trackback.title}</h4>
            <p>{$trackback.body|@strip_tags|@escape:all}</p>
        {if $entry.is_entry_owner}
            <p><span class="silk-delete"></span> <a href="{$serendipityBaseURL}comment.php?serendipity[delete]={$trackback.id}&amp;serendipity[entry]={$trackback.entry_id}&amp;serendipity[type]=trackbacks">{$CONST.DELETE}</a></p>
        {/if}
        </div>
    </div>
{foreachelse}
    <div class="alert alert-info">{$CONST.NO_TRACKBACKS}</div>
{/foreach}
