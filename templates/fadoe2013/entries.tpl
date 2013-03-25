<!-- ENTRIES START -->
    {serendipity_hookPlugin hook="entries_header" addData="$entry_id"}

    {foreach from=$entries item="dategroup"}

        {foreach from=$dategroup.entries item="entry"}

            {assign var="entry" value=$entry scope="parent"}

            <h2><a href="{$entry.link}">{$entry.title|@default:$entry.body|truncate:200:" ..."}</a></h2>

            <div class="pull-right entryinfo">
                <ul class="unstyled">
                    <li><span class="silk-user"></span> <a href="{$entry.link_author}">{$entry.author}</a></li>
                    <li><span class="silk-calendar"></span> {$dategroup.date|@formatTime:DATE_FORMAT_ENTRY}, {$entry.timestamp|@formatTime:'%H:%M'} Uhr</li>
                    {if $entry.categories}
                    <li><span class="silk-text_list_bullets"></span> {foreach from=$entry.categories item="entry_category" name="categories"}<a href="{$entry_category.category_link}">{$entry_category.category_name|@escape}</a>{if not $smarty.foreach.categories.last}, {/if}{/foreach}</li>
                    {/if}
                    {if $entry.freetag.tags.tags}
                    <li><span class="silk-tag_blue"></span> {foreach from=$entry.freetag.tags.tags item="tag" name="tags"}{$tag}{if not $smarty.foreach.tags.last}, {/if}{/foreach}</li>
                    {/if}
                    <li><span class="silk-comments"></span> <a href="{$entry.link}#comments">{$entry.comments} {$entry.label_comments}</a> / <a href="{$entry.link}#trackbacks">{$entry.trackbacks} {$entry.label_trackbacks}</a></li>
                </ul>

            </div>

            <!--
            <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                     xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/"
                     xmlns:dc="http://purl.org/dc/elements/1.1/">
            <rdf:Description
                     rdf:about="{$entry.link_rdf}"
                     trackback:ping="{$entry.link_trackback}"
                     dc:title="{$entry.title_rdf|@default:$entry.title}"
                     dc:identifier="{$entry.rdf_ident}" />
            </rdf:RDF>
            -->

            {if $is_single_entry}
                <div class="lead">
            {/if}
            {$entry.body}
            {if $is_single_entry}
                </div>
            {/if}

            {if $entry.has_extended and not $is_single_entry and not $entry.is_extended}
                <p><a href="{$entry.link}#extended">{$CONST.VIEW_EXTENDED_ENTRY|@sprintf:$entry.title}</a></p>
            {/if}

            {if $entry.is_extended}
                <section id="extended">
                    {$entry.extended}
                </section>
            {/if}

            {$entry.plugin_display_dat}

            {if $is_single_entry and not $is_preview}

                {if $CONST.DATA_UNSUBSCRIBED}
                    <div class="alert success">{$CONST.DATA_UNSUBSCRIBED|@sprintf:$CONST.UNSUBSCRIBE_OK}</div>
                {/if}

                {if $CONST.DATA_TRACKBACK_DELETED}
                    <div class="alert success">{$CONST.DATA_TRACKBACK_DELETED|@sprintf:$CONST.TRACKBACK_DELETED}</div>
                {/if}

                {if $CONST.DATA_TRACKBACK_APPROVED}
                    <div class="alert success">{$CONST.DATA_TRACKBACK_APPROVED|@sprintf:$CONST.TRACKBACK_APPROVED}</div>
                {/if}

                {if $CONST.DATA_COMMENT_DELETED}
                    <div class="alert success">{$CONST.DATA_COMMENT_DELETED|@sprintf:$CONST.COMMENT_DELETED}</div>
                {/if}

                {if $CONST.DATA_COMMENT_APPROVED}
                    <div class="alert success">{$CONST.DATA_COMMENT_APPROVED|@sprintf:$CONST.COMMENT_APPROVED}</div>
                {/if}

                <section id="trackbacks">

                    <h3>{$CONST.TRACKBACKS}</h3>

                    <p><span class="cus-link"></span> <a rel="nofollow" id="trackback-url" href="{$entry.link_trackback}" title="{$CONST.TRACKBACK_SPECIFIC_ON_CLICK|@escape}">{$CONST.TRACKBACK_SPECIFIC}</a></p>

                    {serendipity_printTrackbacks entry=$entry.id}

                </section>

                <section id="comments">

                    <h3>{$CONST.COMMENTS}</h3>

                    <p><span class="cus-comments"></span> <a rel="nofollow" id="commentfeed-url" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/comments.rss2?cid={$entry.id}" title="Dieser Link ist nicht aktiv. Er enthält die URL zum Kommentar-Feed für diesen Eintrag.">Kommentar-Feed für diesen Eintrag</a></p>

                    {serendipity_printComments entry=$entry.id mode=$entry.viewmode}

                    {if $entry.is_entry_owner}
                        {if $entry.allow_comments}
                            <div class="serendipity_center">(<a href="{$entry.link_deny_comments}">{$CONST.COMMENTS_DISABLE}</a>)</div>
                        {else}
                            <div class="serendipity_center">(<a href="{$entry.link_allow_comments}">{$CONST.COMMENTS_ENABLE}</a>)</div>
                        {/if}
                    {/if}

                    {foreach from=$comments_messagestack item="message"}
                        <div class="alert alert-info">{$message}</div>
                    {/foreach}

                    {if $is_comment_added}
                        <div class="alert alert-success">{$CONST.COMMENT_ADDED}</div>
                    {elseif $is_comment_moderate}
                        <div class="alert alert-info">{$CONST.COMMENT_ADDED}<br />{$CONST.THIS_COMMENT_NEEDS_REVIEW}</div>
                    {elseif not $entry.allow_comments}
                        <div class="alert alert-error">{$CONST.COMMENTS_CLOSED}</div>
                    {else}
                        <h3>{$CONST.ADD_COMMENT}</h3>
                        {$COMMENTFORM}
                    {/if}

                </section>

            {/if}

            {$entry.backend_preview}

        {/foreach}
    {foreachelse}
        {if not $plugin_clean_page}
            <h3>{$CONST.ADMIN_FRONTPAGE}</h3>
            <div class="alert alert-info">
                {$CONST.NO_ENTRIES_TO_PRINT}
            </div>
        {/if}
    {/foreach}

    <ul class="pager">
        {if $footer_info}
            {if $footer_prev_page}
                <li class="previous">
                    <a href="{$footer_prev_page}">{$CONST.PREVIOUS_PAGE}</a>
                </li>
            {else}
                <li class="previous disabled">
                    <span>{$CONST.PREVIOUS_PAGE}</span>
                </li>
            {/if}
        {/if}

        {if $footer_info}
            <li>({$footer_info})</li>
        {/if}

        {if $footer_info}
            {if $footer_next_page}
                <li class="next">
                    <a href="{$footer_next_page}">{$CONST.NEXT_PAGE}</a>
                </li>
            {else}
                <li class="next disabled">
                    <span>{$CONST.NEXT_PAGE}</span>
                </li>
            {/if}
        {/if}
    </ul>

    {serendipity_hookPlugin hook="entries_footer"}

<!-- ENTRIES END -->
