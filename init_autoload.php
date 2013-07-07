<?php

if (file_exists('vendor/autoload.php')) {
    $loader = include 'vendor/autoload.php';
}

if (!$loader instanceof \Composer\Autoload\ClassLoader) {
    throw new \RuntimeException('Unable to load composer. Run `php composer.phar install`.');
}