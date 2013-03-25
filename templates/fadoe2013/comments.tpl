
{foreach from=$comments item=comment name="comments"}

    <div class="media" id="c{$comment.id}">

        <span class="pull-left">{$comment.avatar}</span>

        <div class="media-body" id="serendipity_replyform_{$comment.id}">
            <h4 class="media-heading"><a href="#c{$comment.id}">#{$comment.trace}</a> {$comment.author|@default:$CONST.ANONYMOUS} am {$comment.timestamp|@formatTime:$CONST.DATE_FORMAT_SHORT}</h4>
            {if $comment.body == 'COMMENT_DELETED'}
                <div class="alert alter-error">{$CONST.COMMENT_IS_DELETED}</div>
            {else}
                <p>{$comment.body}</p>
            {/if}

            <p>
                {if $comment.url}
                    <span class="silk-house_link"></span> <a class="comment_source_url" href="{$comment.url}" title="{$comment.url|@escape}">{$CONST.HOMEPAGE}</a>
                {/if}
                {if $entry.allow_comments AND $comment.body != 'COMMENT_DELETED'}
                    <span class="silk-pencil"></span> <a href="#serendipity_CommentForm" id="serendipity_reply_{$comment.id}" onclick="document.getElementById('serendipity_replyTo').value='{$comment.id}'; {$comment_onchange}">{$CONST.REPLY}</a>
                {/if}
                {if $entry.is_entry_owner AND $comment.body != 'COMMENT_DELETED'}
                    <span class="silk-delete"></span> <a class="comment_source_ownerlink" href="{$comment.link_delete}" onclick="return confirm('{$CONST.COMMENT_DELETE_CONFIRM|@sprintf:$comment.id:$comment.author}');">{$CONST.DELETE}</a>
                {/if}
            </p>

        </div>

    </div>
{foreachelse}
    <div class="alert alert-info">{$CONST.NO_COMMENTS}</div>
{/foreach}
