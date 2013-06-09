name "java"
description "Set up Oracle/Run JDK"
default_attributes(
	:java => {
		:install_flavor => "oracle", 
  		:oracle => {
  			"accept_oracle_download_terms" => true
  		}
  	}
)
