<?php
/**
 * Created by JetBrains PhpStorm.
 * User: falk
 * Date: 07.07.13
 * Time: 22:07
 * To change this template use File | Settings | File Templates.
 */

namespace SerendipityTest\Version;

use Serendipity\Version\Version;

class VersionTest extends \PHPUnit_Framework_TestCase
{
    public function testVersionCompare()
    {
        $expect = -1;
        for ($i = 0; $i < 2; $i++) {
            for ($j = 0; $j < 12; $j++) {
                for ($k = 0; $k < 20; $k++) {
                    foreach (array('dev', 'pr', 'PR', 'alpha', 'a1', 'a2', 'beta', 'b1', 'b2', 'RC', 'RC1', 'RC2', 'RC3', '', 'pl1', 'PL1') as $rel) {
                        $ver = "$i.$j.$k$rel";
                        $normalizedVersion = strtolower(Version::VERSION);
                        if (strtolower($ver) === $normalizedVersion
                            || strtolower("$i.$j.$k-$rel") === $normalizedVersion
                            || strtolower("$i.$j.$k.$rel") === $normalizedVersion
                            || strtolower("$i.$j.$k $rel") === $normalizedVersion
                        ) {
                            if ($expect == -1) {
                                $expect = 1;
                            }
                        } else {
                            $this->assertSame(
                                Version::compareVersion($ver),
                                $expect,
                                "For version '$ver' and Serendipity\\Version::VERSION = '"
                                . Version::VERSION . "': result=" . (Version::compareVersion($ver))
                                . ', but expected ' . $expect);
                        }
                    }
                }
            }
        }
    }

    public function testIsProduction()
    {
    }

    public function testGetCoreVersion()
    {
    }

}
