$moduleRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Import-Module "$moduleRoot\deploy\hello-world.psm1" -Force

Describe 'Use-HelloWorld' {

  It "Runs without a name parameter" {
    { Use-HelloWorld } | Should Not Throw
  }

  It "Runs when passing a name parameters" {
    { Use-HelloWorld -Name 'Github' } | Should Not Throw
  }

  It "Returns the proper output" {
    $result_param = Use-HelloWorld -Name 'Github'
    $result_param | Should -Be "Hello, Github!"
    $result = Use-HelloWorld
    $result | Should -Be "Hello, World!"
  }
}