function deactivate_priceprediction --on-event virtualenv_did_deactivate:priceprediction
	set -e PRICEPREDICTION_MONGO_HOST
	set -e PRICEPREDICTION_MONGO_PORT
end
