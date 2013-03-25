
{if $comments}
<div class="media">
{/if}

{foreach from=$comments item=comment name="comments"}

<div id="c{$comment.id}"></div>

    <span class="pull-left">{$comment.avatar}</span>

    <div class="media-body">
        {if $comment.body == 'COMMENT_DELETED'}
            {$CONST.COMMENT_IS_DELETED}
        {else}
            <p>{$comment.body}</p>
        {/if}

        <div class="serendipity_comment_source">
            <a class="comment_source_trace" href="#c{$comment.id}">#{$comment.trace}</a>
            <span class="comment_source_author">
            {if $comment.email}
                <a href="mailto:{$comment.email}">{$comment.author|@default:$CONST.ANONYMOUS}</a>
            {else}
                {$comment.author|@default:$CONST.ANONYMOUS}
            {/if}
            </span>
            {if $comment.url}
                (<a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{$CONST.HOMEPAGE}</a>)
            {/if}
            {$CONST.ON}
            <span class="comment_source_date">{$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</span>

            {if $entry.is_entry_owner}
                (<a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>)
            {/if}
            {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
                (<a class="comment_reply" href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>)
                <div id="serendipity_replyform_{$comment.id}"></div>
            {/if}
        </div>
    </div>
{foreachelse}
    <div class="alert alert-info">{$CONST.NO_COMMENTS}</div>
{/foreach}

{if $comments}
</div>
{/if}
