require_relative 'cookbook'
require_relative 'controller'
require_relative 'router'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)
# cookbook = Cookbook.new
# p cookbook
controller = Controller.new(cookbook)
# p controller
router = Router.new(controller)

# Start the app
router.run
