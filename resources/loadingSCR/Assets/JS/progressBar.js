var config = {
    progressBarType: 1,

    progressBars: {
        "INIT_CORE": {
            enabled: false,
        },
 
        "INIT_BEFORE_MAP_LOADED": {
            enabled: true,
        },
 
        "MAP": {
            enabled: true,
        },
 
        "INIT_AFTER_MAP_LOADED": {
            enabled: true,
        },
 
        "INIT_SESSION": {
            enabled: true,
        }
    }
}

var types = [
    "INIT_CORE",
    "INIT_BEFORE_MAP_LOADED",
    "MAP",
    "INIT_AFTER_MAP_LOADED",
    "INIT_SESSION"
];

var stateCount = 4;
var states = {};

const handlers = {
    startInitFunction(data) {
        if (states[data.type] == null) {
            states[data.type] = {};
            states[data.type].count = 0;
            states[data.type].done = 0;   

            if (data.type == types[0]) {
                stateCount++;
            }
        }
    },

    startInitFunctionOrder(data) {
        if (states[data.type] != null) {
            states[data.type].count += data.count;
        }
    },

    initFunctionInvoked(data) {
        if(states[data.type] != null) {
            states[data.type].done++;
        }
    },

    startDataFileEntries(data) {
        states["MAP"] = {};
        states["MAP"].count = data.count;
        states["MAP"].done = 0; 
    },

    performMapLoadFunction(data) {
        states["MAP"].done++;
    },

    onLogLine(data) {
        document.querySelector('#infos').innerHTML = data.message + "...";
        document.querySelector('#session').fadeIn();
    }
};

window.addEventListener('message', function(e) {
    (handlers[e.data.eventName] || function() {})(e.data);
});

function GetTypeProgress(type) {
    if(states[type] != null) {
        var doneCount = states[type].done;
        var totalCount = states[type].count;

        if(doneCount <= 0 || isNaN(doneCount) || totalCount <= 0 || isNaN(totalCount)) {
            return 0;
        }

        var progress = states[type].done / states[type].count;
        return Math.round(progress * 100);
    }

    return 0;
}

function GetTotalProgress() {
    var totalProgress = 0;
    var totalStates = 0;
    
    for(var i = 0; i < types.length; i++) {
        var key = types[i];
        if(config.progressBars[key].enabled) {
            totalProgress += GetTypeProgress(key);
            totalStates++;
        }
    }

    if (totalProgress <= 0 || isNaN(totalProgress) || totalStates <= 0 || isNaN(totalStates)) {
        return 0;
    }

    return Math.round(totalProgress / totalStates);
}

Init();

var progressCache = [];

function Init() {
    setInterval(UpdateSingle, 250);
}

function UpdateMulti() {
    UpdateTotalProgress();

    //Set individual loading bars:
    for(i = 0; i < types.length; i++)
    {
        var progress =  GetTypeProgress(types[i]);
        var progressBar = document.getElementById("pb" + i);
        
        if(progressCache[i] != null)
        {
            progress = Math.max(progress, progressCache[i]);
        }

        if(isNaN(progress))
        {
            progress = 0;
            console.log("Woops!")
        }

        progressBar.value = progress;
        progressCache[i] = progress;
    }
}    

function UpdateSingle() {
    UpdateTotalProgress();

    var progressBar = document.getElementById("progressBar");
    progressBar.value = progressCache[10];
}

function UpdateTotalProgress() {
    var total = GetTotalProgress();
    var totalProgress = document.getElementById("progress-bar-value");

    if (progressCache[10] != null) {
        total = Math.max(total, progressCache[10]);
    }
    
    totalProgress.innerHTML = Math.round(total);
    progressCache[10] = total;
}