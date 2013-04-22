{foreach from=$plugindata item=item}
    <div class="box container_{$item.class}">
        {if $item.title != ""}
            <div class="category">{$item.title}</div>
        {/if}
        <div class="content">
            {$item.content}
        </div>
    </div>
{/foreach}
