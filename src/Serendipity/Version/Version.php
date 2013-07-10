<?php
/**
 * Serendipity Blogging Engine
 *
 */

namespace Serendipity\Version;

final class Version
{
    const VERSION = '2.0-alpha1';

    public static function isProduction()
    {
        return (preg_match('/\-(alpha|beta|cvs|rc)/', self::VERSION) ? false : true);
    }

    /**
     * @param $version
     * @return integer -1 if the $version is older, 0 if they are the same, and +1 if $version is newer.
     */
    public static function compareVersion($version)
    {
        $version = strtolower($version);
        $version = preg_replace('/(\d)pr(\d?)/', '$1a$2', $version);
        return version_compare($version, strtolower(self::VERSION));
    }

    /**
     * Get the current serendipity version, minus the "-alpha", "-beta" or whatever tags
     *
     * @return string Serendipity version, stripped of unneeded parts
     */
    public static function getCoreVersion()
    {
        return preg_replace('@^([0-9\.]+).*$@', '\1', self::VERSION);
    }

}