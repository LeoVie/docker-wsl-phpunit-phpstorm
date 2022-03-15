<?php

namespace Leovie\DockerWslPhpunitPhpstorm\Model;

class User
{
    public function __construct(private string $name, private string $password)
    {
    }

    public function getName(): string
    {
        return $this->name;
    }

    public function getPassword(): string
    {
        return $this->password;
    }
}