{serendipity_hookPlugin hook="entries_header"}
<h2 class="serendipity_date">{$CONST.ARCHIVES}</h2>
{foreach from=$archives item="archive"}

    <h3>{$archive.year}</h3>

    <dl class="dl-horizontal">
    {foreach from=$archive.months item="month"}
    {if $month.entry_count}
        <dt>{$month.date|@formatTime:"%B"}</dt>
        <dd><a href="{$month.link}">{$month.entry_count} {$CONST.ENTRIES}</a></dd>
    {/if}
    {/foreach}
    </dl>
{/foreach}

<div class="serendipity_pageFooter" style="text-align: center">{serendipity_hookPlugin hook="entries_footer"}</div>
