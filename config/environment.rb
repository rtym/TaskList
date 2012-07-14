# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TaskList::Application.initialize!

# Initialize delta for thinking sphinx
ThinkingSphinx.suppress_delta_output = true

