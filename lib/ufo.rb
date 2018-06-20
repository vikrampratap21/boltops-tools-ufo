$:.unshift(File.expand_path('../', __FILE__))
require 'ufo/version'
require 'deep_merge'
require 'colorize'
require 'fileutils'
require 'render_me_pretty'
require 'memoist'

module Ufo
  autoload :AwsService, 'ufo/aws_service'
  autoload :Base, 'ufo/base'
  autoload :Cancel, 'ufo/cancel'
  autoload :CLI, 'ufo/cli'
  autoload :Command, 'ufo/command'
  autoload :Completer, "ufo/completer"
  autoload :Completion, "ufo/completion"
  autoload :Core, 'ufo/core'
  autoload :Current, 'ufo/current'
  autoload :Destroy, 'ufo/destroy'
  autoload :Docker, 'ufo/docker'
  autoload :DSL, 'ufo/dsl'
  autoload :Ecr, 'ufo/ecr'
  autoload :ECS, 'ufo/ecs'
  autoload :Help, 'ufo/help'
  autoload :Info, 'ufo/info'
  autoload :Init, 'ufo/init'
  autoload :LogGroup, 'ufo/log_group'
  autoload :Network, 'ufo/network'
  autoload :Param, 'ufo/param'
  autoload :Scale, 'ufo/scale'
  autoload :Sequence, 'ufo/sequence'
  autoload :Setting, 'ufo/setting'
  autoload :Ship, 'ufo/ship'
  autoload :Stack, 'ufo/stack'
  autoload :Task, 'ufo/task'
  autoload :Tasks, 'ufo/tasks'
  autoload :TemplateScope, 'ufo/template_scope'
  autoload :Upgrade3, "ufo/upgrade3"
  autoload :Upgrade33_to_34, "ufo/upgrade33_to_34"
  autoload :Util, 'ufo/util'

  extend Core
end
