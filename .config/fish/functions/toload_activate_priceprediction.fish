function activate_priceprediction --on-event virtualenv_did_activate:priceprediction
    set -gx PRICEPREDICTION_MONGO_HOST ncepbrowne
    set -gx PRICEPREDICTION_MONGO_PORT 27017
end
