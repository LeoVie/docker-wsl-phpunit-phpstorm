<?php

namespace Leovie\DockerWslPhpunitPhpstorm\Tests\Model;

use Leovie\DockerWslPhpunitPhpstorm\Model\User;
use PHPUnit\Framework\TestCase;

class UserTest extends TestCase
{
    public function testGetName(): void
    {
        $name = 'John Doe';

        self::assertSame($name, (new User($name, 'secret'))->getName());
    }
}