require 'java'
$CLASSPATH << "jolt-core/target/classes/"

java_import "com.bazaarvoice.jolt.Chainr"

puts Chainr.inspect
