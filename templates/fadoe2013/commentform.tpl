
<form class="form-horizontal" action="{$commentform_action}#feedback" method="post">

    <input type="hidden" name="serendipity[entry_id]" value="{$commentform_id}" />

    <div class="control-group">
        <label class="control-label" for="serendipity_commentform_name">{$CONST.NAME}</label>
        <div class="controls">
            <input type="text" id="serendipity_commentform_name" name="serendipity[name]" value="{$commentform_name}" size="30" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="serendipity_commentform_email">{$CONST.EMAIL}</label>
        <div class="controls">
            <input type="text" id="serendipity_commentform_email" name="serendipity[email]" value="{$commentform_email}" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="serendipity_commentform_url">{$CONST.HOMEPAGE}</label>
        <div class="controls">
            <input type="text" id="serendipity_commentform_url" name="serendipity[url]" value="{$commentform_url}" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="serendipity_replyTo">{$CONST.IN_REPLY_TO}</label>
        <div class="controls">
            {$commentform_replyTo}
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="serendipity_commentform_comment">{$CONST.COMMENT}</label>
        <div class="controls">
            <textarea rows="10" id="serendipity_commentform_comment" name="serendipity[comment]">{$commentform_data}</textarea><br />
            {serendipity_hookPlugin hook="frontend_comment" data=$commentform_entry}
        </div>
    </div>

    {if $is_commentform_showToolbar}
        <div class="control-group">
            <div class="controls">
                <label class="checkbox" for="checkbox_remember">
                    <input id="checkbox_remember" type="checkbox" name="serendipity[remember]" {$commentform_remember} />
                    {$CONST.REMEMBER_INFO}
                </label>
            </div>

        {if $is_allowSubscriptions}
                <div class="controls">
                    <label class="checkbox" for="checkbox_subscribe">
                        <input id="checkbox_subscribe" type="checkbox" name="serendipity[subscribe]" {$commentform_subscribe} />
                        {$CONST.SUBSCRIBE_TO_THIS_ENTRY}
                    </label>
                </div>
        {/if}
        </div>
    {/if}

    {if $is_moderate_comments}
        <div class="alert alert-info">{$CONST.COMMENTS_WILL_BE_MODERATED}</div>
    {/if}

    <div class="control-group">
        <div class="controls">
            <input class="btn" type="submit" name="serendipity[submit]" value="{$CONST.SUBMIT_COMMENT}" /> <input class="btn" type="submit" id="serendipity_preview" name="serendipity[preview]" value="{$CONST.PREVIEW}" />
        </div>
    </div>

</form>

