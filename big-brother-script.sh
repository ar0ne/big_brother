#!/bin/bash

# define which app is little brother
little_brother='firefox'
# define apps that should little brother should not know about
whitelist=( 'transmission-qt' 'chromium')

is_whitelist_app_running() {
    apps=("$@")
    for app in "${apps[@]}" ; do
        if [ "$(ps --no-headers -C $app)" ]; then
            return 0
        fi
    done
    return 1
}

is_working_hours() {
    # Working hours
    local start_hour=9
    local end_hour=20

    # Get current hour in 24-hour format (00-23)
    local current_hour=$(date +%H)

    # Convert to integer for numeric comparison
    current_hour=$((10#$current_hour))

    # Check if current hour is within working hours
    if [ $current_hour -ge $start_hour ] && [ $current_hour -lt $end_hour ]; then
        return 0  # True - within working hours
    else
        return 1  # False - outside working hours
    fi
}


# if current time not within working hours - kill LB
if ! is_working_hours; then
    echo "Current time is outside of working hours. Sleep little bro."
    pkill -f $little_brother
    exit 0
fi

# if any app from whitelist is UP - kill LB
if is_whitelist_app_running "${whitelist[@]}"; then
    echo "Whitelisted app is running. Sleep little bro."
    pkill -f $little_brother
    exit 0
fi

# if LB is down, make it UP
if ! [ "$(ps --no-headers -C $little_brother)" ]; then
    echo "Wake up little one"
    nohup $little_brother
fi
