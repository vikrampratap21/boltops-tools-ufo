module Ufo
  class Info < Base
    def run
      unless service
        puts no_service_message
        return
      end

      puts "Service: #{@pretty_service_name.colorize(:green)}"
      puts "Service name: #{service.service_name}"
      puts "Status: #{service.status}"
      puts "Running count: #{service.running_count}"
      puts "Desired count: #{service.desired_count}"
      puts "Launch type: #{service.launch_type}"
      puts "Task definition: #{service.task_definition.split('/').last}"
      dns = load_balancer_dns(service)
      puts "Dns: #{dns}" if dns

      puts
      puts "Resources:"
      stack_resources.each do |r|
        # pp r
        puts "#{r.logical_resource_id} - #{r.resource_type}:"
        puts "  #{r.physical_resource_id}"
      end
    end

    # Passing in service so method can be used else where.
    def load_balancer_dns(service)
      load_balancer = service.load_balancers.first
      return unless load_balancer

      resp = elb.describe_target_groups(
        target_group_arns: [load_balancer.target_group_arn]
      )
      target_group = resp.target_groups.first
      load_balancer_arn = target_group.load_balancer_arns.first # assume first only

      resp = elb.describe_load_balancers(load_balancer_arns: [load_balancer_arn])
      load_balancer = resp.load_balancers.first
      load_balancer.dns_name
    end
    memoize :load_balancer_dns

    def service
      stack = find_stack(@stack_name)
      return unless stack

      service = stack_resources.find { |r| r.resource_type == "AWS::ECS::Service" }
      arn = service.physical_resource_id
      resp = ecs.describe_services(services: [arn], cluster: @cluster)
      resp.services.first
    end
    memoize :service

    def stack_resources
      resp = cloudformation.describe_stack_resources(stack_name: @stack_name)
      resp.stack_resources
    end
    memoize :stack_resources
  end
end
