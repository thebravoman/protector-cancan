require 'protector'
require 'cancan'
require 'active_support/all'
require 'protector/cancan/ability'
require 'protector/cancan/resource'
require 'protector/cancan/version'

CanCan::Ability.send :include, Protector::CanCan::Ability
CanCan::ControllerResource.send :prepend, Protector::CanCan::Resource
CanCan::InheritedResource.send :prepend, Protector::CanCan::Resource