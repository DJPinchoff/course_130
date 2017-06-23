# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc)

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end
check_return_with_lambda
# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# Group 5
def block_method_3
  yield
end

block_method_3 { return }
=begin
Comparison

Procs and implicit blocks sometimes have the same behavior when we return from them. If a Proc is defined outside a method, and we return from it, then we'll get an error. The same thing occurs if we try to return from an implicit block, where the block itself isn't defined in a method. An error is thrown if we try to return from it.

If we try to return from within a Proc that is defined within a method, then we immediately exit the method.

If we try to return from a Lambda, the same outcome occurs, regardless of whether the Lambda is defined outside a method or inside of it. Eventually, program execution will proceed to the next line after the #call to that lambda.
=end
