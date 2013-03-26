<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang}" lang="{$lang}">
    <head>
        <title>{$head_title|@default:$blogTitle} {if $head_subtitle} - {$head_subtitle}{/if}</title>
        <meta http-equiv="Content-Type" content="text/html; charset={$head_charset}" />
        <meta name="Powered-By" content="Serendipity {$head_version}" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="alternate" type="application/rss+xml" title="{$blogTitle} RSS feed" href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/index.rss2" />
        <link rel="alternate" type="application/x.atom+xml"  title="{$blogTitle} Atom feed"  href="{$serendipityBaseURL}{$serendipityRewritePrefix}feeds/atom.xml" />

        <style type="text/css" media="screen">
            @import url("{serendipity_getFile file="css/bootstrap.min.css"}");
            @import url("{serendipity_getFile file="css/bootstrap-responsive.min.css"}");
            @import url("{serendipity_getFile file="css/fadoe2013.css"}");
            @import url("{serendipity_getFile file="css/silk-icons.css"}");
        </style>

    {if $entry_id}
        <link rel="pingback" href="{$serendipityBaseURL}comment.php?type=pingback&amp;entry_id={$entry_id}" />
    {/if}

    {serendipity_hookPlugin hook="frontend_header"}

        <script type="text/javascript" src="{serendipity_getFile file="js/fadoe2013.js"}"></script>
    </head>

    <body>

        <header>
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <h3>{$blogTitle}</h3>
                        <p>{$blogDescription}</p>
                    </div>
                </div>
            </div>

            <div class="navbar navbar-static-top navbar-orange">
                <div class="navbar-inner">
                    <div class="container">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                        <nav class="nav-collapse collapse">
                            <ul class="nav">
                                <li {if $startpage}class="active"{/if}><a href="{$serendipityBaseURL}">Blog</a></li>
                                <li {if $archive}class="active"{/if}><a href="{$serendipityBaseURL}archive">{$CONST.ARCHIVES}</a></li>
                            </ul>

                            <form id="searchform" class="navbar-form form-search pull-right" action="{$serendipityHTTPPath}{$serendipityIndexFile}" method="get">
                                <input type="hidden" name="serendipity[action]" value="search" />
                                <div class="input-append">
                                    <input class="span2 search-query" id="serendipityQuickSearchTermField" name="serendipity[searchTerm]" type="text" placeholder="{$CONST.QUICKSEARCH}" />
                                    <input class="btn btn-primary" id="searchsend" name="serendipity[searchButton]" type="submit" value="{$CONST.GO}" />
                                </div>
                            </form>
                        </nav><!--/.nav-collapse -->
                    </div><!--/.container -->
                </div><!--/.navbar-inner -->
             </div>

        </header>

        <section id="main" class="container">

            <div class="container">

                <div class="row">

                    <div class="span9">
                        <div class="content">
                        {$CONTENT}
                        </div>
                    </div>

                    <div class="span3">
                    {serendipity_printSidebar side="right"}
                    </div>
                </div>

            </div>

        </section>

        <footer>
            <div class="container">
            <p class="text-center">&copy; 2013 Falk Döring | Betrieben mit <a href="http://www.s9y.org">Serendipity</a> | Theme erstellt mit <a href="http://twitter.github.com/bootstrap/">Twitter Bootstrap</a></p>
            </div>
        </footer>

    {serendipity_hookPlugin hook="frontend_footer"}

    </body>
</html>
