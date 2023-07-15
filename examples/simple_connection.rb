# tiny example so you can play with the lxdkit or make a failing example for an issue
require 'bundler/setup'
require 'lxdkit'
require 'lxdkit/dsl'
include LXDKit::DSL

on [ENV.fetch("HOST")] do
  execute "echo hello"
end
