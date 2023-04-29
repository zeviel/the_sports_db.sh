#!/bin/bash

api="https://www.thesportsdb.com/api/v1/json/3"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function get_all_leagues() {
    curl --request GET \
        --url "$api/all_leagues.php" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_all_countries() {
    curl --request GET \
        --url "$api/all_countries.php" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_leagues_in_country() {
    # 1 - country: (string): <country>
    # 2 - sport: (string): <sport>
    curl --request GET \
        --url "$api/search_all_leagues.php?c=$1&s=${2:-}" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_seasons_in_league() {
    # 1 - league_id: (integer): <league_id>
    curl --request GET \
        --url "$api/search_all_seasons.php?id=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_teams_in_league() {
    # 1 - league_name: (string): <league_name>
    # 2 - country: (string): <country>
    curl --request GET \
        --url "$api/search_all_teams.php?l=$1&c=${2:-}" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_teams_details_in_league() {
    # 1 - league_id: (integer): <league_id>
    curl --request GET \
        --url "$api/lookup_all_teams.php?id=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_players_in_team() {
    # 1 - team_id: (integer): <team_id>
    curl --request GET \
        --url "$api/lookup_all_players.php?id=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}

function get_user_loved_teams_and_players() {
    # 1 - user: (string): <user - required>
    curl --request GET \
        --url "$api/searchloves.php?u=$1" \
        --user-agent "$user_agent" \
        --header "content-type: application/json"
}
