{if $is_raw_mode}
<div id="serendipity{$pluginside}SideBar">
{/if}
{foreach from=$plugindata item=item}
    <aside id="container_{$item.class}" class="sidebar">
        {if $item.title != ""}<h4 class="{$item.class}">{$item.title}</h4>{/if}
        <div class="serendipitySideBarContent">
            {$item.content}
        </div>
    </aside>
{/foreach}
{if $is_raw_mode}
</div>
{/if}
