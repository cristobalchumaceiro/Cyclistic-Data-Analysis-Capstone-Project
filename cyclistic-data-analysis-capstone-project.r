{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "16ece5c4",
   "metadata": {
    "_cell_guid": "1946fec0-4d1a-4125-8931-4a89cd154e4f",
    "_uuid": "cd5a4c1b-844d-4928-8ccd-4e455d7f3587",
    "papermill": {
     "duration": 0.010211,
     "end_time": "2024-07-19T17:26:35.017143",
     "exception": false,
     "start_time": "2024-07-19T17:26:35.006932",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Cyclistic Data Analysis Capstone Project\n",
    "\n",
    "## Introduction\n",
    "\n",
    "This is a data analysis project created as part of the Google Data Analytics Professional Certificate. The project is an analysis of trip data from users of a fictional bike-share company called Cyclistic. The objective is to understand how casual riders and annual members use Cyclistic bikes differently. From these I make recommendations on a marketing strategy to convert casual riders into annual members backed up with data insights and visualisations.\n",
    "\n",
    "### About the Data\n",
    "\n",
    "The data used for this project is found [here](https://divvy-tripdata.s3.amazonaws.com/index.html), it has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). For the purposes of this project we will be using trip data from 2023, the data is stored in 12 CSV files pertaining to each month of the year."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "de0fe4a8",
   "metadata": {
    "_cell_guid": "fe0a4f09-354b-4159-a811-57a0496c4690",
    "_uuid": "20875dd9-738a-4c21-8fb8-79606db197dc",
    "papermill": {
     "duration": 0.009357,
     "end_time": "2024-07-19T17:26:35.036173",
     "exception": false,
     "start_time": "2024-07-19T17:26:35.026816",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Data Analysis in R \n",
    "\n",
    "Here we start by loading the relevant packages used throughout the project."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "0c4f0e83",
   "metadata": {
    "_cell_guid": "e1acdfd0-4034-4159-9c03-da2e46c424cc",
    "_kg_hide-output": true,
    "_uuid": "80122b44-9f59-4f25-ad9c-01ac6ac73692",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:26:35.058453Z",
     "iopub.status.busy": "2024-07-19T17:26:35.056495Z",
     "iopub.status.idle": "2024-07-19T17:26:36.467411Z",
     "shell.execute_reply": "2024-07-19T17:26:36.465063Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.424868,
     "end_time": "2024-07-19T17:26:36.470304",
     "exception": false,
     "start_time": "2024-07-19T17:26:35.045436",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.5\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.5.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘scales’\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    discard\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "The following object is masked from ‘package:readr’:\n",
      "\n",
      "    col_factor\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m\u001b[90m[conflicted]\u001b[39m Will prefer \u001b[1m\u001b[34mdplyr\u001b[39m\u001b[22m::filter over any other package.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m\u001b[90m[conflicted]\u001b[39m Will prefer \u001b[1m\u001b[34mdplyr\u001b[39m\u001b[22m::lag over any other package.\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(scales)\n",
    "library(skimr)\n",
    "library(fs)\n",
    "library(conflicted)  \n",
    "\n",
    "conflict_prefer(\"filter\", \"dplyr\")\n",
    "conflict_prefer(\"lag\", \"dplyr\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b4702e44",
   "metadata": {
    "_cell_guid": "7992c058-5b95-4bc7-a1b9-303184af5d5e",
    "_uuid": "74db74d8-85e9-423b-a621-32d775a01e38",
    "papermill": {
     "duration": 0.01158,
     "end_time": "2024-07-19T17:26:36.493656",
     "exception": false,
     "start_time": "2024-07-19T17:26:36.482076",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Since we have a number of .csv files to work with, we have to create a directory for them, and merge them into a single .csv file we can start processing and cleaning."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "13933222",
   "metadata": {
    "_cell_guid": "8ee498f5-adf5-4c6f-928c-26538f068d28",
    "_kg_hide-output": true,
    "_uuid": "ac02f4b4-ee42-4586-a5fd-c6bde447f391",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:26:36.548737Z",
     "iopub.status.busy": "2024-07-19T17:26:36.518137Z",
     "iopub.status.idle": "2024-07-19T17:27:10.692792Z",
     "shell.execute_reply": "2024-07-19T17:27:10.691005Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 34.190762,
     "end_time": "2024-07-19T17:27:10.695523",
     "exception": false,
     "start_time": "2024-07-19T17:26:36.504761",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m190301\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m190445\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m258678\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m426590\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m604827\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m719618\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m767650\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m771693\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m666371\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m537113\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m362518\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m224073\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n"
     ]
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "data_dir <- \"/kaggle/input/2023-divvy-trip-data/2023-divvy-tripdata_CSV\"\n",
    "\n",
    "csv_files <- dir_ls(data_dir)\n",
    "\n",
    "csv_files_merged <- csv_files %>% \n",
    "  map_dfr(read_csv)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "256e47bc",
   "metadata": {
    "_cell_guid": "387444d7-46f7-4986-9107-0facfe06b252",
    "_uuid": "77736920-89ea-46d5-a661-beb19ba6739e",
    "papermill": {
     "duration": 0.012909,
     "end_time": "2024-07-19T17:27:10.722694",
     "exception": false,
     "start_time": "2024-07-19T17:27:10.709785",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "To continue, I create two new columns on a new version of the merged file. These two columns will display the duration of each trip in minutes, and the day of the week the ride started at (as a number 1 through 7, 1 = Sunday and so forth). We also use the skim_without_charts() function to seek out any columns or entries that need cleaning."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "09c8ef05",
   "metadata": {
    "_cell_guid": "100669e6-7350-47f6-ae6e-9c6887b6723b",
    "_uuid": "4532dd82-bc57-460c-bb8f-b160e3e69059",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:27:10.751039Z",
     "iopub.status.busy": "2024-07-19T17:27:10.749646Z",
     "iopub.status.idle": "2024-07-19T17:27:53.488612Z",
     "shell.execute_reply": "2024-07-19T17:27:53.487061Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 42.768881,
     "end_time": "2024-07-19T17:27:53.504191",
     "exception": false,
     "start_time": "2024-07-19T17:27:10.735310",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "── Data Summary ────────────────────────\n",
      "                           Values \n",
      "Name                       data   \n",
      "Number of rows             5719877\n",
      "Number of columns          15     \n",
      "_______________________           \n",
      "Column type frequency:            \n",
      "  character                7      \n",
      "  numeric                  6      \n",
      "  POSIXct                  2      \n",
      "________________________          \n",
      "Group variables            None   \n",
      "\n",
      "── Variable type: character ────────────────────────────────────────────────────\n",
      "  skim_variable      n_missing complete_rate min max empty n_unique whitespace\n",
      "\u001b[90m1\u001b[39m ride_id                    0         1      16  16     0  5\u001b[4m7\u001b[24m\u001b[4m1\u001b[24m\u001b[4m9\u001b[24m877          0\n",
      "\u001b[90m2\u001b[39m rideable_type              0         1      11  13     0        3          0\n",
      "\u001b[90m3\u001b[39m start_station_name    \u001b[4m8\u001b[24m\u001b[4m7\u001b[24m\u001b[4m5\u001b[24m716         0.847   3  64     0     \u001b[4m1\u001b[24m592          0\n",
      "\u001b[90m4\u001b[39m start_station_id      \u001b[4m8\u001b[24m\u001b[4m7\u001b[24m\u001b[4m5\u001b[24m848         0.847   3  35     0     \u001b[4m1\u001b[24m516          0\n",
      "\u001b[90m5\u001b[39m end_station_name      \u001b[4m9\u001b[24m\u001b[4m2\u001b[24m\u001b[4m9\u001b[24m202         0.838   3  64     0     \u001b[4m1\u001b[24m597          0\n",
      "\u001b[90m6\u001b[39m end_station_id        \u001b[4m9\u001b[24m\u001b[4m2\u001b[24m\u001b[4m9\u001b[24m343         0.838   3  36     0     \u001b[4m1\u001b[24m520          0\n",
      "\u001b[90m7\u001b[39m member_casual              0         1       6   6     0        2          0\n",
      "\n",
      "── Variable type: numeric ──────────────────────────────────────────────────────\n",
      "  skim_variable    n_missing complete_rate   mean       sd       p0    p25\n",
      "\u001b[90m1\u001b[39m start_lat                0         1      41.9    0.045\u001b[4m1\u001b[24m     41.6  41.9 \n",
      "\u001b[90m2\u001b[39m start_lng                0         1     -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m6\u001b[39m    0.027\u001b[4m3\u001b[24m    -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m9\u001b[39m -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m7\u001b[39m \n",
      "\u001b[90m3\u001b[39m end_lat               \u001b[4m6\u001b[24m990         0.999  41.9    0.054\u001b[4m4\u001b[24m      0    41.9 \n",
      "\u001b[90m4\u001b[39m end_lng               \u001b[4m6\u001b[24m990         0.999 -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m6\u001b[39m    0.069\u001b[4m2\u001b[24m    -\u001b[31m88\u001b[39m\u001b[31m.\u001b[39m\u001b[31m2\u001b[39m -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m7\u001b[39m \n",
      "\u001b[90m5\u001b[39m ride_length_mins         0         1      18.2  181.     -\u001b[31m\u001b[4m1\u001b[24m\u001b[4m6\u001b[24m6\u001b[39m\u001b[31m57\u001b[39m\u001b[31m.\u001b[39m    5.42\n",
      "\u001b[90m6\u001b[39m day_of_the_week          0         1       4.12   1.99        1     2   \n",
      "     p50   p75    p100 hist \n",
      "\u001b[90m1\u001b[39m  41.9   41.9    42.1 ▁▁▆▇▁\n",
      "\u001b[90m2\u001b[39m -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m6\u001b[39m  -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m6\u001b[39m   -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m5\u001b[39m ▁▁▅▇▁\n",
      "\u001b[90m3\u001b[39m  41.9   41.9    42.2 ▁▁▁▁▇\n",
      "\u001b[90m4\u001b[39m -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m6\u001b[39m  -\u001b[31m87\u001b[39m\u001b[31m.\u001b[39m\u001b[31m6\u001b[39m     0   ▇▁▁▁▁\n",
      "\u001b[90m5\u001b[39m   9.53  16.9 \u001b[4m9\u001b[24m\u001b[4m8\u001b[24m489.  ▇▁▁▁▁\n",
      "\u001b[90m6\u001b[39m   4      6       7   ▇▃▃▃▇\n",
      "\n",
      "── Variable type: POSIXct ──────────────────────────────────────────────────────\n",
      "  skim_variable n_missing complete_rate min                 max                \n",
      "\u001b[90m1\u001b[39m started_at            0             1 2023-01-01 \u001b[90m00:01:58\u001b[39m 2023-12-31 \u001b[90m23:59:38\u001b[39m\n",
      "\u001b[90m2\u001b[39m ended_at              0             1 2023-01-01 \u001b[90m00:02:41\u001b[39m 2024-01-01 \u001b[90m23:50:51\u001b[39m\n",
      "  median              n_unique\n",
      "\u001b[90m1\u001b[39m 2023-07-20 \u001b[90m18:02:50\u001b[39m  4\u001b[4m8\u001b[24m\u001b[4m2\u001b[24m\u001b[4m3\u001b[24m909\n",
      "\u001b[90m2\u001b[39m 2023-07-20 \u001b[90m18:19:47\u001b[39m  4\u001b[4m8\u001b[24m\u001b[4m3\u001b[24m\u001b[4m5\u001b[24m702\n"
     ]
    }
   ],
   "source": [
    "csv_files_merged <- csv_files_merged %>% \n",
    "  mutate(ride_length_mins = as.numeric(difftime(ended_at, started_at, units = \"mins\")),\n",
    "         day_of_the_week = wday(started_at))\n",
    "\n",
    "skim_tee(csv_files_merged)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5929e449",
   "metadata": {
    "_cell_guid": "508b7ad6-0855-4357-83fc-4560e80b850c",
    "_uuid": "bbc1a48c-a190-4ba4-8da3-9ccf8ad3f775",
    "papermill": {
     "duration": 0.013226,
     "end_time": "2024-07-19T17:27:53.530395",
     "exception": false,
     "start_time": "2024-07-19T17:27:53.517169",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "From here we can see a few instances of missing, or dirty data that could potentially skew our results. Trip duration in particular we can see contains a number of negative data entries. We are not looking to include these as part of our analysis and so we filter them out, along with any missing values, of which there are many in the 'start_station_name', 'start_station_id', 'end_station_name', 'end_station_id', and in the 'end_lat' and 'end_lng' columns. This would indicate that start/end points for rides were not recorded for these particular trips."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "9bca12e9",
   "metadata": {
    "_cell_guid": "5991a538-de0e-49d4-a91e-0bcc4dd96888",
    "_uuid": "0370cfd4-53b1-4043-a81d-2af305029d62",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:27:53.559238Z",
     "iopub.status.busy": "2024-07-19T17:27:53.557909Z",
     "iopub.status.idle": "2024-07-19T17:27:55.233628Z",
     "shell.execute_reply": "2024-07-19T17:27:55.231855Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.693055,
     "end_time": "2024-07-19T17:27:55.236575",
     "exception": false,
     "start_time": "2024-07-19T17:27:53.543520",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "csv_files_merged_v2 <- csv_files_merged %>%\n",
    "  filter(ride_length_mins > 0 & complete.cases(.))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c80afd40",
   "metadata": {
    "_cell_guid": "e23faae1-5ea4-441a-a13d-9ec64468d7f4",
    "_uuid": "9813f7b1-c5c9-4a6a-966f-aecdfb9bf467",
    "papermill": {
     "duration": 0.01313,
     "end_time": "2024-07-19T17:27:55.263026",
     "exception": false,
     "start_time": "2024-07-19T17:27:55.249896",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Before we begin to plot graphs, we can conduct some very basic descriptive data analysis on variables such as trip duration between casual and member users."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "3e9739f5",
   "metadata": {
    "_cell_guid": "28d3da1b-1d48-4769-85e9-e298278bd5eb",
    "_uuid": "3d9017e9-35fb-4c9b-afa3-df60b42963bc",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:27:55.292665Z",
     "iopub.status.busy": "2024-07-19T17:27:55.291292Z",
     "iopub.status.idle": "2024-07-19T17:28:09.437105Z",
     "shell.execute_reply": "2024-07-19T17:28:09.434909Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 14.163555,
     "end_time": "2024-07-19T17:28:09.439964",
     "exception": false,
     "start_time": "2024-07-19T17:27:55.276409",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>ride_length_mins</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>22.9402</td></tr>\n",
       "\t<tr><td>member</td><td>12.1326</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & ride\\_length\\_mins\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 22.9402\\\\\n",
       "\t member & 12.1326\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | ride_length_mins &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 22.9402 |\n",
       "| member | 12.1326 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual ride_length_mins\n",
       "1 casual        22.9402         \n",
       "2 member        12.1326         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>ride_length_mins</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>12.750000</td></tr>\n",
       "\t<tr><td>member</td><td> 8.616667</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & ride\\_length\\_mins\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 12.750000\\\\\n",
       "\t member &  8.616667\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | ride_length_mins &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 12.750000 |\n",
       "| member |  8.616667 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual ride_length_mins\n",
       "1 casual        12.750000       \n",
       "2 member         8.616667       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>ride_length_mins</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>12136.300</td></tr>\n",
       "\t<tr><td>member</td><td> 1497.867</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & ride\\_length\\_mins\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 12136.300\\\\\n",
       "\t member &  1497.867\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | ride_length_mins &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 12136.300 |\n",
       "| member |  1497.867 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual ride_length_mins\n",
       "1 casual        12136.300       \n",
       "2 member         1497.867       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>ride_length_mins</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>0.01666667</td></tr>\n",
       "\t<tr><td>member</td><td>0.01666667</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & ride\\_length\\_mins\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 0.01666667\\\\\n",
       "\t member & 0.01666667\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | ride_length_mins &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 0.01666667 |\n",
       "| member | 0.01666667 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual ride_length_mins\n",
       "1 casual        0.01666667      \n",
       "2 member        0.01666667      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  aggregate(ride_length_mins ~ member_casual, FUN = mean)\n",
    "\n",
    "csv_files_merged_v2 %>% \n",
    "  aggregate(ride_length_mins ~ member_casual, FUN = median)\n",
    "\n",
    "csv_files_merged_v2 %>% \n",
    "  aggregate(ride_length_mins ~ member_casual, FUN = max)\n",
    "\n",
    "csv_files_merged_v2 %>% \n",
    "  aggregate(ride_length_mins ~ member_casual, FUN = min)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b7371748",
   "metadata": {
    "_cell_guid": "106ad633-a2f5-4053-b29c-542dc66c6a22",
    "_uuid": "ff043420-6f4a-4ad0-ac94-3eafdcba0b9d",
    "papermill": {
     "duration": 0.013722,
     "end_time": "2024-07-19T17:28:09.467963",
     "exception": false,
     "start_time": "2024-07-19T17:28:09.454241",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "From these results we can see that the average trip duration for a casual user is almost double that of member users, we will begin to explore this in more detail further on. \n",
    "\n",
    "For now, we will create a few more columns in preparation for our data visualisation. These are 'weekday', 'month', and 'year' which will tell us information about when each trip began as text for 'weekday' and 'month' (e.g. 'Monday' and 'September'), and year as a 4-digit number (e.g. 2023)."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "a0ca8e3c",
   "metadata": {
    "_cell_guid": "bdd7486e-387e-4890-8a9e-99386eecb355",
    "_uuid": "7b3bad3b-f03a-469f-bc63-98bd6a016d1d",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:09.498607Z",
     "iopub.status.busy": "2024-07-19T17:28:09.497222Z",
     "iopub.status.idle": "2024-07-19T17:28:19.510686Z",
     "shell.execute_reply": "2024-07-19T17:28:19.509023Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 10.031158,
     "end_time": "2024-07-19T17:28:19.512870",
     "exception": false,
     "start_time": "2024-07-19T17:28:09.481712",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "csv_files_merged_v2 <- csv_files_merged_v2 %>% \n",
    "  mutate(time_started_at = hour(started_at),\n",
    "         weekday = wday(started_at, label = TRUE),\n",
    "         month = month(started_at, label = TRUE),\n",
    "         year = year(started_at))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "28a4903d",
   "metadata": {
    "_cell_guid": "69830153-d074-4715-a151-dd5074d1aace",
    "_uuid": "106fca4a-0f40-4bfc-a851-a468ea76574b",
    "papermill": {
     "duration": 0.013761,
     "end_time": "2024-07-19T17:28:19.541039",
     "exception": false,
     "start_time": "2024-07-19T17:28:19.527278",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "With this information we will produce 3 tables below with the data we will use to plot the subsequent graphs."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c760ab80",
   "metadata": {
    "_cell_guid": "25ccf69c-6de9-450b-8ec3-02fae35f6a28",
    "_uuid": "3c411f21-186b-4ed1-83c1-3e6d79e430c7",
    "papermill": {
     "duration": 0.013745,
     "end_time": "2024-07-19T17:28:19.568544",
     "exception": false,
     "start_time": "2024-07-19T17:28:19.554799",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Number of Trips per Hour by User Type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "b676c64a",
   "metadata": {
    "_cell_guid": "74af6b60-9408-4bc0-a3ca-21acdd904731",
    "_uuid": "15dcc781-27d6-4c61-b587-1dd1ead53e0c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:19.598819Z",
     "iopub.status.busy": "2024-07-19T17:28:19.597520Z",
     "iopub.status.idle": "2024-07-19T17:28:19.769800Z",
     "shell.execute_reply": "2024-07-19T17:28:19.768261Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.189781,
     "end_time": "2024-07-19T17:28:19.771975",
     "exception": false,
     "start_time": "2024-07-19T17:28:19.582194",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 48 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>time_started_at</th><th scope=col>number_of_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td> 0</td><td> 25014</td></tr>\n",
       "\t<tr><td>casual</td><td> 1</td><td> 16064</td></tr>\n",
       "\t<tr><td>casual</td><td> 2</td><td>  9273</td></tr>\n",
       "\t<tr><td>casual</td><td> 3</td><td>  4703</td></tr>\n",
       "\t<tr><td>casual</td><td> 4</td><td>  3589</td></tr>\n",
       "\t<tr><td>casual</td><td> 5</td><td>  8221</td></tr>\n",
       "\t<tr><td>casual</td><td> 6</td><td> 22161</td></tr>\n",
       "\t<tr><td>casual</td><td> 7</td><td> 39117</td></tr>\n",
       "\t<tr><td>casual</td><td> 8</td><td> 52962</td></tr>\n",
       "\t<tr><td>casual</td><td> 9</td><td> 53025</td></tr>\n",
       "\t<tr><td>casual</td><td>10</td><td> 67215</td></tr>\n",
       "\t<tr><td>casual</td><td>11</td><td> 85102</td></tr>\n",
       "\t<tr><td>casual</td><td>12</td><td>100341</td></tr>\n",
       "\t<tr><td>casual</td><td>13</td><td>104365</td></tr>\n",
       "\t<tr><td>casual</td><td>14</td><td>108294</td></tr>\n",
       "\t<tr><td>casual</td><td>15</td><td>119584</td></tr>\n",
       "\t<tr><td>casual</td><td>16</td><td>138588</td></tr>\n",
       "\t<tr><td>casual</td><td>17</td><td>150613</td></tr>\n",
       "\t<tr><td>casual</td><td>18</td><td>126628</td></tr>\n",
       "\t<tr><td>casual</td><td>19</td><td> 92696</td></tr>\n",
       "\t<tr><td>casual</td><td>20</td><td> 66273</td></tr>\n",
       "\t<tr><td>casual</td><td>21</td><td> 54606</td></tr>\n",
       "\t<tr><td>casual</td><td>22</td><td> 48332</td></tr>\n",
       "\t<tr><td>casual</td><td>23</td><td> 34764</td></tr>\n",
       "\t<tr><td>member</td><td> 0</td><td> 23579</td></tr>\n",
       "\t<tr><td>member</td><td> 1</td><td> 13589</td></tr>\n",
       "\t<tr><td>member</td><td> 2</td><td>  7437</td></tr>\n",
       "\t<tr><td>member</td><td> 3</td><td>  4708</td></tr>\n",
       "\t<tr><td>member</td><td> 4</td><td>  5922</td></tr>\n",
       "\t<tr><td>member</td><td> 5</td><td> 26722</td></tr>\n",
       "\t<tr><td>member</td><td> 6</td><td> 84793</td></tr>\n",
       "\t<tr><td>member</td><td> 7</td><td>158363</td></tr>\n",
       "\t<tr><td>member</td><td> 8</td><td>194736</td></tr>\n",
       "\t<tr><td>member</td><td> 9</td><td>127074</td></tr>\n",
       "\t<tr><td>member</td><td>10</td><td>113646</td></tr>\n",
       "\t<tr><td>member</td><td>11</td><td>134054</td></tr>\n",
       "\t<tr><td>member</td><td>12</td><td>152479</td></tr>\n",
       "\t<tr><td>member</td><td>13</td><td>151248</td></tr>\n",
       "\t<tr><td>member</td><td>14</td><td>152806</td></tr>\n",
       "\t<tr><td>member</td><td>15</td><td>189068</td></tr>\n",
       "\t<tr><td>member</td><td>16</td><td>258601</td></tr>\n",
       "\t<tr><td>member</td><td>17</td><td>303476</td></tr>\n",
       "\t<tr><td>member</td><td>18</td><td>235025</td></tr>\n",
       "\t<tr><td>member</td><td>19</td><td>163841</td></tr>\n",
       "\t<tr><td>member</td><td>20</td><td>112627</td></tr>\n",
       "\t<tr><td>member</td><td>21</td><td> 85493</td></tr>\n",
       "\t<tr><td>member</td><td>22</td><td> 61868</td></tr>\n",
       "\t<tr><td>member</td><td>23</td><td> 38453</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 48 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & time\\_started\\_at & number\\_of\\_rides\\\\\n",
       " <chr> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t casual &  0 &  25014\\\\\n",
       "\t casual &  1 &  16064\\\\\n",
       "\t casual &  2 &   9273\\\\\n",
       "\t casual &  3 &   4703\\\\\n",
       "\t casual &  4 &   3589\\\\\n",
       "\t casual &  5 &   8221\\\\\n",
       "\t casual &  6 &  22161\\\\\n",
       "\t casual &  7 &  39117\\\\\n",
       "\t casual &  8 &  52962\\\\\n",
       "\t casual &  9 &  53025\\\\\n",
       "\t casual & 10 &  67215\\\\\n",
       "\t casual & 11 &  85102\\\\\n",
       "\t casual & 12 & 100341\\\\\n",
       "\t casual & 13 & 104365\\\\\n",
       "\t casual & 14 & 108294\\\\\n",
       "\t casual & 15 & 119584\\\\\n",
       "\t casual & 16 & 138588\\\\\n",
       "\t casual & 17 & 150613\\\\\n",
       "\t casual & 18 & 126628\\\\\n",
       "\t casual & 19 &  92696\\\\\n",
       "\t casual & 20 &  66273\\\\\n",
       "\t casual & 21 &  54606\\\\\n",
       "\t casual & 22 &  48332\\\\\n",
       "\t casual & 23 &  34764\\\\\n",
       "\t member &  0 &  23579\\\\\n",
       "\t member &  1 &  13589\\\\\n",
       "\t member &  2 &   7437\\\\\n",
       "\t member &  3 &   4708\\\\\n",
       "\t member &  4 &   5922\\\\\n",
       "\t member &  5 &  26722\\\\\n",
       "\t member &  6 &  84793\\\\\n",
       "\t member &  7 & 158363\\\\\n",
       "\t member &  8 & 194736\\\\\n",
       "\t member &  9 & 127074\\\\\n",
       "\t member & 10 & 113646\\\\\n",
       "\t member & 11 & 134054\\\\\n",
       "\t member & 12 & 152479\\\\\n",
       "\t member & 13 & 151248\\\\\n",
       "\t member & 14 & 152806\\\\\n",
       "\t member & 15 & 189068\\\\\n",
       "\t member & 16 & 258601\\\\\n",
       "\t member & 17 & 303476\\\\\n",
       "\t member & 18 & 235025\\\\\n",
       "\t member & 19 & 163841\\\\\n",
       "\t member & 20 & 112627\\\\\n",
       "\t member & 21 &  85493\\\\\n",
       "\t member & 22 &  61868\\\\\n",
       "\t member & 23 &  38453\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 48 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | time_started_at &lt;int&gt; | number_of_rides &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual |  0 |  25014 |\n",
       "| casual |  1 |  16064 |\n",
       "| casual |  2 |   9273 |\n",
       "| casual |  3 |   4703 |\n",
       "| casual |  4 |   3589 |\n",
       "| casual |  5 |   8221 |\n",
       "| casual |  6 |  22161 |\n",
       "| casual |  7 |  39117 |\n",
       "| casual |  8 |  52962 |\n",
       "| casual |  9 |  53025 |\n",
       "| casual | 10 |  67215 |\n",
       "| casual | 11 |  85102 |\n",
       "| casual | 12 | 100341 |\n",
       "| casual | 13 | 104365 |\n",
       "| casual | 14 | 108294 |\n",
       "| casual | 15 | 119584 |\n",
       "| casual | 16 | 138588 |\n",
       "| casual | 17 | 150613 |\n",
       "| casual | 18 | 126628 |\n",
       "| casual | 19 |  92696 |\n",
       "| casual | 20 |  66273 |\n",
       "| casual | 21 |  54606 |\n",
       "| casual | 22 |  48332 |\n",
       "| casual | 23 |  34764 |\n",
       "| member |  0 |  23579 |\n",
       "| member |  1 |  13589 |\n",
       "| member |  2 |   7437 |\n",
       "| member |  3 |   4708 |\n",
       "| member |  4 |   5922 |\n",
       "| member |  5 |  26722 |\n",
       "| member |  6 |  84793 |\n",
       "| member |  7 | 158363 |\n",
       "| member |  8 | 194736 |\n",
       "| member |  9 | 127074 |\n",
       "| member | 10 | 113646 |\n",
       "| member | 11 | 134054 |\n",
       "| member | 12 | 152479 |\n",
       "| member | 13 | 151248 |\n",
       "| member | 14 | 152806 |\n",
       "| member | 15 | 189068 |\n",
       "| member | 16 | 258601 |\n",
       "| member | 17 | 303476 |\n",
       "| member | 18 | 235025 |\n",
       "| member | 19 | 163841 |\n",
       "| member | 20 | 112627 |\n",
       "| member | 21 |  85493 |\n",
       "| member | 22 |  61868 |\n",
       "| member | 23 |  38453 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual time_started_at number_of_rides\n",
       "1  casual         0               25014         \n",
       "2  casual         1               16064         \n",
       "3  casual         2                9273         \n",
       "4  casual         3                4703         \n",
       "5  casual         4                3589         \n",
       "6  casual         5                8221         \n",
       "7  casual         6               22161         \n",
       "8  casual         7               39117         \n",
       "9  casual         8               52962         \n",
       "10 casual         9               53025         \n",
       "11 casual        10               67215         \n",
       "12 casual        11               85102         \n",
       "13 casual        12              100341         \n",
       "14 casual        13              104365         \n",
       "15 casual        14              108294         \n",
       "16 casual        15              119584         \n",
       "17 casual        16              138588         \n",
       "18 casual        17              150613         \n",
       "19 casual        18              126628         \n",
       "20 casual        19               92696         \n",
       "21 casual        20               66273         \n",
       "22 casual        21               54606         \n",
       "23 casual        22               48332         \n",
       "24 casual        23               34764         \n",
       "25 member         0               23579         \n",
       "26 member         1               13589         \n",
       "27 member         2                7437         \n",
       "28 member         3                4708         \n",
       "29 member         4                5922         \n",
       "30 member         5               26722         \n",
       "31 member         6               84793         \n",
       "32 member         7              158363         \n",
       "33 member         8              194736         \n",
       "34 member         9              127074         \n",
       "35 member        10              113646         \n",
       "36 member        11              134054         \n",
       "37 member        12              152479         \n",
       "38 member        13              151248         \n",
       "39 member        14              152806         \n",
       "40 member        15              189068         \n",
       "41 member        16              258601         \n",
       "42 member        17              303476         \n",
       "43 member        18              235025         \n",
       "44 member        19              163841         \n",
       "45 member        20              112627         \n",
       "46 member        21               85493         \n",
       "47 member        22               61868         \n",
       "48 member        23               38453         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, time_started_at) %>% \n",
    "  summarise(number_of_rides = n(), .groups = \"drop_last\") %>% \n",
    "  arrange(member_casual, time_started_at)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0868c710",
   "metadata": {
    "_cell_guid": "0eff17e0-c689-4465-82bd-1eb67c1b9090",
    "_uuid": "71ecfda6-d68e-42e4-9844-8b2e3eb9cd5f",
    "papermill": {
     "duration": 0.014121,
     "end_time": "2024-07-19T17:28:19.800532",
     "exception": false,
     "start_time": "2024-07-19T17:28:19.786411",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Number of Trips and Average Duration per Weekday by User Type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "3919761b",
   "metadata": {
    "_cell_guid": "42e28efc-b0f6-4533-9483-c3cec80df28e",
    "_uuid": "fb3e0795-eb36-4d18-8e33-3db176be3b16",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:19.833359Z",
     "iopub.status.busy": "2024-07-19T17:28:19.831444Z",
     "iopub.status.idle": "2024-07-19T17:28:20.028906Z",
     "shell.execute_reply": "2024-07-19T17:28:20.027314Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.216309,
     "end_time": "2024-07-19T17:28:20.031055",
     "exception": false,
     "start_time": "2024-07-19T17:28:19.814746",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekday</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sun</td><td>254711</td><td>26.56853</td></tr>\n",
       "\t<tr><td>casual</td><td>Mon</td><td>175382</td><td>22.53662</td></tr>\n",
       "\t<tr><td>casual</td><td>Tue</td><td>181510</td><td>20.51477</td></tr>\n",
       "\t<tr><td>casual</td><td>Wed</td><td>183065</td><td>19.60103</td></tr>\n",
       "\t<tr><td>casual</td><td>Thu</td><td>198905</td><td>19.99985</td></tr>\n",
       "\t<tr><td>casual</td><td>Fri</td><td>227828</td><td>22.32194</td></tr>\n",
       "\t<tr><td>casual</td><td>Sat</td><td>310129</td><td>25.91907</td></tr>\n",
       "\t<tr><td>member</td><td>Sun</td><td>307821</td><td>13.61443</td></tr>\n",
       "\t<tr><td>member</td><td>Mon</td><td>386651</td><td>11.55102</td></tr>\n",
       "\t<tr><td>member</td><td>Tue</td><td>448779</td><td>11.64995</td></tr>\n",
       "\t<tr><td>member</td><td>Wed</td><td>452679</td><td>11.58707</td></tr>\n",
       "\t<tr><td>member</td><td>Thu</td><td>452610</td><td>11.60283</td></tr>\n",
       "\t<tr><td>member</td><td>Fri</td><td>400471</td><td>12.04020</td></tr>\n",
       "\t<tr><td>member</td><td>Sat</td><td>350597</td><td>13.58463</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & weekday & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Sun & 254711 & 26.56853\\\\\n",
       "\t casual & Mon & 175382 & 22.53662\\\\\n",
       "\t casual & Tue & 181510 & 20.51477\\\\\n",
       "\t casual & Wed & 183065 & 19.60103\\\\\n",
       "\t casual & Thu & 198905 & 19.99985\\\\\n",
       "\t casual & Fri & 227828 & 22.32194\\\\\n",
       "\t casual & Sat & 310129 & 25.91907\\\\\n",
       "\t member & Sun & 307821 & 13.61443\\\\\n",
       "\t member & Mon & 386651 & 11.55102\\\\\n",
       "\t member & Tue & 448779 & 11.64995\\\\\n",
       "\t member & Wed & 452679 & 11.58707\\\\\n",
       "\t member & Thu & 452610 & 11.60283\\\\\n",
       "\t member & Fri & 400471 & 12.04020\\\\\n",
       "\t member & Sat & 350597 & 13.58463\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekday &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sun | 254711 | 26.56853 |\n",
       "| casual | Mon | 175382 | 22.53662 |\n",
       "| casual | Tue | 181510 | 20.51477 |\n",
       "| casual | Wed | 183065 | 19.60103 |\n",
       "| casual | Thu | 198905 | 19.99985 |\n",
       "| casual | Fri | 227828 | 22.32194 |\n",
       "| casual | Sat | 310129 | 25.91907 |\n",
       "| member | Sun | 307821 | 13.61443 |\n",
       "| member | Mon | 386651 | 11.55102 |\n",
       "| member | Tue | 448779 | 11.64995 |\n",
       "| member | Wed | 452679 | 11.58707 |\n",
       "| member | Thu | 452610 | 11.60283 |\n",
       "| member | Fri | 400471 | 12.04020 |\n",
       "| member | Sat | 350597 | 13.58463 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual weekday number_of_rides average_duration\n",
       "1  casual        Sun     254711          26.56853        \n",
       "2  casual        Mon     175382          22.53662        \n",
       "3  casual        Tue     181510          20.51477        \n",
       "4  casual        Wed     183065          19.60103        \n",
       "5  casual        Thu     198905          19.99985        \n",
       "6  casual        Fri     227828          22.32194        \n",
       "7  casual        Sat     310129          25.91907        \n",
       "8  member        Sun     307821          13.61443        \n",
       "9  member        Mon     386651          11.55102        \n",
       "10 member        Tue     448779          11.64995        \n",
       "11 member        Wed     452679          11.58707        \n",
       "12 member        Thu     452610          11.60283        \n",
       "13 member        Fri     400471          12.04020        \n",
       "14 member        Sat     350597          13.58463        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n(), average_duration = mean(ride_length_mins), .groups = \"drop_last\") %>% \n",
    "  arrange(member_casual, weekday)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0c2f090d",
   "metadata": {
    "_cell_guid": "dfd7101f-c352-4ce9-811c-406773ea3c5b",
    "_uuid": "60563386-0038-4cee-85e4-30dfba2b697b",
    "papermill": {
     "duration": 0.014601,
     "end_time": "2024-07-19T17:28:20.060425",
     "exception": false,
     "start_time": "2024-07-19T17:28:20.045824",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Number of Trips and Average Duration per Month by User Type"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "854c812d",
   "metadata": {
    "_cell_guid": "876b8ffe-b4bf-40a5-b818-efa3a3efbd73",
    "_uuid": "a848fc40-8025-4522-a5cd-2f759655c322",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:20.092877Z",
     "iopub.status.busy": "2024-07-19T17:28:20.091389Z",
     "iopub.status.idle": "2024-07-19T17:28:20.289043Z",
     "shell.execute_reply": "2024-07-19T17:28:20.287433Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.216537,
     "end_time": "2024-07-19T17:28:20.291321",
     "exception": false,
     "start_time": "2024-07-19T17:28:20.074784",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 24 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>year</th><th scope=col>month</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Jan</td><td> 29618</td><td>14.88039</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Feb</td><td> 32774</td><td>17.67338</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Mar</td><td> 46786</td><td>16.72132</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Apr</td><td>110526</td><td>22.62311</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>May</td><td>177025</td><td>24.52642</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Jun</td><td>219778</td><td>24.07532</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Jul</td><td>245254</td><td>25.22009</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Aug</td><td>233819</td><td>24.35999</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Sep</td><td>196938</td><td>23.53625</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Oct</td><td>130269</td><td>21.38491</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Nov</td><td> 72061</td><td>17.88977</td></tr>\n",
       "\t<tr><td>casual</td><td>2023</td><td>Dec</td><td> 36682</td><td>16.53621</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Jan</td><td>118662</td><td>10.00456</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Feb</td><td>116778</td><td>10.42253</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Mar</td><td>153647</td><td>10.17140</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Apr</td><td>213647</td><td>11.55650</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>May</td><td>286162</td><td>12.69483</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Jun</td><td>314941</td><td>12.94545</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Jul</td><td>328622</td><td>13.35210</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Aug</td><td>351002</td><td>13.31333</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Sep</td><td>309617</td><td>12.67493</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Oct</td><td>273433</td><td>11.64999</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Nov</td><td>202661</td><td>11.05589</td></tr>\n",
       "\t<tr><td>member</td><td>2023</td><td>Dec</td><td>130436</td><td>10.80486</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 24 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " member\\_casual & year & month & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <dbl> & <ord> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 2023 & Jan &  29618 & 14.88039\\\\\n",
       "\t casual & 2023 & Feb &  32774 & 17.67338\\\\\n",
       "\t casual & 2023 & Mar &  46786 & 16.72132\\\\\n",
       "\t casual & 2023 & Apr & 110526 & 22.62311\\\\\n",
       "\t casual & 2023 & May & 177025 & 24.52642\\\\\n",
       "\t casual & 2023 & Jun & 219778 & 24.07532\\\\\n",
       "\t casual & 2023 & Jul & 245254 & 25.22009\\\\\n",
       "\t casual & 2023 & Aug & 233819 & 24.35999\\\\\n",
       "\t casual & 2023 & Sep & 196938 & 23.53625\\\\\n",
       "\t casual & 2023 & Oct & 130269 & 21.38491\\\\\n",
       "\t casual & 2023 & Nov &  72061 & 17.88977\\\\\n",
       "\t casual & 2023 & Dec &  36682 & 16.53621\\\\\n",
       "\t member & 2023 & Jan & 118662 & 10.00456\\\\\n",
       "\t member & 2023 & Feb & 116778 & 10.42253\\\\\n",
       "\t member & 2023 & Mar & 153647 & 10.17140\\\\\n",
       "\t member & 2023 & Apr & 213647 & 11.55650\\\\\n",
       "\t member & 2023 & May & 286162 & 12.69483\\\\\n",
       "\t member & 2023 & Jun & 314941 & 12.94545\\\\\n",
       "\t member & 2023 & Jul & 328622 & 13.35210\\\\\n",
       "\t member & 2023 & Aug & 351002 & 13.31333\\\\\n",
       "\t member & 2023 & Sep & 309617 & 12.67493\\\\\n",
       "\t member & 2023 & Oct & 273433 & 11.64999\\\\\n",
       "\t member & 2023 & Nov & 202661 & 11.05589\\\\\n",
       "\t member & 2023 & Dec & 130436 & 10.80486\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 24 × 5\n",
       "\n",
       "| member_casual &lt;chr&gt; | year &lt;dbl&gt; | month &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| casual | 2023 | Jan |  29618 | 14.88039 |\n",
       "| casual | 2023 | Feb |  32774 | 17.67338 |\n",
       "| casual | 2023 | Mar |  46786 | 16.72132 |\n",
       "| casual | 2023 | Apr | 110526 | 22.62311 |\n",
       "| casual | 2023 | May | 177025 | 24.52642 |\n",
       "| casual | 2023 | Jun | 219778 | 24.07532 |\n",
       "| casual | 2023 | Jul | 245254 | 25.22009 |\n",
       "| casual | 2023 | Aug | 233819 | 24.35999 |\n",
       "| casual | 2023 | Sep | 196938 | 23.53625 |\n",
       "| casual | 2023 | Oct | 130269 | 21.38491 |\n",
       "| casual | 2023 | Nov |  72061 | 17.88977 |\n",
       "| casual | 2023 | Dec |  36682 | 16.53621 |\n",
       "| member | 2023 | Jan | 118662 | 10.00456 |\n",
       "| member | 2023 | Feb | 116778 | 10.42253 |\n",
       "| member | 2023 | Mar | 153647 | 10.17140 |\n",
       "| member | 2023 | Apr | 213647 | 11.55650 |\n",
       "| member | 2023 | May | 286162 | 12.69483 |\n",
       "| member | 2023 | Jun | 314941 | 12.94545 |\n",
       "| member | 2023 | Jul | 328622 | 13.35210 |\n",
       "| member | 2023 | Aug | 351002 | 13.31333 |\n",
       "| member | 2023 | Sep | 309617 | 12.67493 |\n",
       "| member | 2023 | Oct | 273433 | 11.64999 |\n",
       "| member | 2023 | Nov | 202661 | 11.05589 |\n",
       "| member | 2023 | Dec | 130436 | 10.80486 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual year month number_of_rides average_duration\n",
       "1  casual        2023 Jan    29618          14.88039        \n",
       "2  casual        2023 Feb    32774          17.67338        \n",
       "3  casual        2023 Mar    46786          16.72132        \n",
       "4  casual        2023 Apr   110526          22.62311        \n",
       "5  casual        2023 May   177025          24.52642        \n",
       "6  casual        2023 Jun   219778          24.07532        \n",
       "7  casual        2023 Jul   245254          25.22009        \n",
       "8  casual        2023 Aug   233819          24.35999        \n",
       "9  casual        2023 Sep   196938          23.53625        \n",
       "10 casual        2023 Oct   130269          21.38491        \n",
       "11 casual        2023 Nov    72061          17.88977        \n",
       "12 casual        2023 Dec    36682          16.53621        \n",
       "13 member        2023 Jan   118662          10.00456        \n",
       "14 member        2023 Feb   116778          10.42253        \n",
       "15 member        2023 Mar   153647          10.17140        \n",
       "16 member        2023 Apr   213647          11.55650        \n",
       "17 member        2023 May   286162          12.69483        \n",
       "18 member        2023 Jun   314941          12.94545        \n",
       "19 member        2023 Jul   328622          13.35210        \n",
       "20 member        2023 Aug   351002          13.31333        \n",
       "21 member        2023 Sep   309617          12.67493        \n",
       "22 member        2023 Oct   273433          11.64999        \n",
       "23 member        2023 Nov   202661          11.05589        \n",
       "24 member        2023 Dec   130436          10.80486        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, year, month) %>% \n",
    "  summarise(number_of_rides = n(), average_duration = mean(ride_length_mins), .groups = \"drop_last\") %>% \n",
    "  arrange(member_casual, year, month)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7045ecbe",
   "metadata": {
    "_cell_guid": "7afaa550-070e-4a11-8fc4-1bf71abac0cf",
    "_uuid": "e2553d6a-f51f-49ba-9840-abd5694ca178",
    "papermill": {
     "duration": 0.015557,
     "end_time": "2024-07-19T17:28:20.322947",
     "exception": false,
     "start_time": "2024-07-19T17:28:20.307390",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Data Visualisation in R\n",
    "\n",
    "Now using the ggplots2 package I will create a total of 6 data visualisations comparing count and duration variables across both user types, for weekdays, months, and hours of the day."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "06b74c10",
   "metadata": {
    "_cell_guid": "57397528-8545-4ab1-ba96-4a18fd422f39",
    "_uuid": "f94b671c-136c-4e48-9e6c-9ca5659565e4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:20.356012Z",
     "iopub.status.busy": "2024-07-19T17:28:20.354518Z",
     "iopub.status.idle": "2024-07-19T17:28:20.903778Z",
     "shell.execute_reply": "2024-07-19T17:28:20.901684Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.569239,
     "end_time": "2024-07-19T17:28:20.907037",
     "exception": false,
     "start_time": "2024-07-19T17:28:20.337798",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n7AAAACTx/0903I4O5jvNAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  group_by(member_casual) %>% \n",
    "  summarise(number_of_rides = n(), .groups = \"drop_last\") %>% \n",
    "  arrange(member_casual) %>% \n",
    "  ggplot(aes(x = member_casual, y = number_of_rides, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") + \n",
    "  labs(\n",
    "    title = \"Number of Trips by User Type\", \n",
    "    subtitle = \"Trip Data from January to December 2023\", \n",
    "    x = \"User Type\", \n",
    "    y = \"Number of Trips\", \n",
    "    fill = \"User Type\") + \n",
    "  scale_y_continuous(\n",
    "      labels = label_number(accuracy = 1),\n",
    "      breaks = seq(0, 3000000, by = 500000)) +\n",
    "  theme_minimal() +\n",
    "  theme(panel.grid.major.x = element_blank()) +\n",
    "  scale_fill_discrete(labels = c(\"casual\" = \"Casual\", \"member\" = \"Member\")) +\n",
    "  scale_x_discrete(labels = c(\"casual\" = \"Casual\", \"member\" = \"Member\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b8435f69",
   "metadata": {
    "_cell_guid": "dfc95180-579b-4a69-97e1-24c472d9e48c",
    "_uuid": "3567ec92-7675-44cb-b369-4e6932208823",
    "papermill": {
     "duration": 0.015502,
     "end_time": "2024-07-19T17:28:20.939098",
     "exception": false,
     "start_time": "2024-07-19T17:28:20.923596",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Number of Trips by User Type\n",
    "\n",
    "Here we can see that Members take nearly twice as many trips as Casual users do for the same time period."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "8c115a79",
   "metadata": {
    "_cell_guid": "fca5cc7c-d7f6-435d-b974-c0a7c3f9b3f9",
    "_uuid": "029ede5b-c8f2-4242-8195-7124c36edc7a",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:20.972385Z",
     "iopub.status.busy": "2024-07-19T17:28:20.971135Z",
     "iopub.status.idle": "2024-07-19T17:28:21.918458Z",
     "shell.execute_reply": "2024-07-19T17:28:21.916040Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.966907,
     "end_time": "2024-07-19T17:28:21.921301",
     "exception": false,
     "start_time": "2024-07-19T17:28:20.954394",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nSUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n(), .groups = \"drop_last\") %>% \n",
    "  arrange(member_casual, weekday) %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") + \n",
    "  labs(\n",
    "    title = \"Trips per Weekday by User Type\", \n",
    "    subtitle = \"Trip Data from January to December 2023\", \n",
    "    x = \"Day of the Week\", \n",
    "    y = \"Number of Trips\", \n",
    "    fill = \"User Type\") + \n",
    "  scale_y_continuous(labels = label_number(accuracy = 1)) +\n",
    "  theme_minimal() +\n",
    "  theme(panel.grid.major.x = element_blank()) +\n",
    "  scale_fill_discrete(labels = c(\"casual\" = \"Casual\", \"member\" = \"Member\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ebb21c72",
   "metadata": {
    "_cell_guid": "adaadd7a-cc0f-4bb0-a2be-2bd4f033ecc8",
    "_uuid": "73fa5549-7806-4016-9e02-d3c3dbbd778c",
    "papermill": {
     "duration": 0.016351,
     "end_time": "2024-07-19T17:28:21.954409",
     "exception": false,
     "start_time": "2024-07-19T17:28:21.938058",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Trips per Weekday by User Type\n",
    "\n",
    "This bar graph shoes us the number of trips taken by casual and member users on a given day of the week during 2023. We can clearly see that in terms of trips taken, member users far outweigh casual users. They take more trips every day, especially during the weekdays of Monday to Friday. This would indicate a preference of using the bike-share service as a commuting method to their places of work."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "55d4e1f3",
   "metadata": {
    "_cell_guid": "dd603f95-0e84-47bf-bd93-09540573e1f1",
    "_uuid": "e33bf7f3-fb57-433e-932d-28cbfa1ba256",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:22.013192Z",
     "iopub.status.busy": "2024-07-19T17:28:22.011772Z",
     "iopub.status.idle": "2024-07-19T17:28:22.360377Z",
     "shell.execute_reply": "2024-07-19T17:28:22.357936Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.369793,
     "end_time": "2024-07-19T17:28:22.363462",
     "exception": false,
     "start_time": "2024-07-19T17:28:21.993669",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, month) %>% \n",
    "  summarise(number_of_rides = n(), .groups = \"drop_last\") %>% \n",
    "  arrange(member_casual, month) %>% \n",
    "  ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") + \n",
    "  labs(\n",
    "    title = \"Trips per Month by User Type\", \n",
    "    subtitle = \"Trip Data from January to December 2023\", \n",
    "    x = \"Month\", \n",
    "    y = \"Number of Trips\", \n",
    "    fill = \"User Type\") + \n",
    "  scale_y_continuous(labels = label_number(accuracy = 1)) +\n",
    "  theme_minimal() +\n",
    "  theme(panel.grid.major.x = element_blank()) +\n",
    "  scale_fill_discrete(labels = c(\"casual\" = \"Casual\", \"member\" = \"Member\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c2e880e7",
   "metadata": {
    "_cell_guid": "21e879aa-08f0-46c1-87a5-d9ba39bb9d79",
    "_uuid": "69d97e91-42d8-44b5-82ed-06a0a02312b9",
    "papermill": {
     "duration": 0.016921,
     "end_time": "2024-07-19T17:28:22.397693",
     "exception": false,
     "start_time": "2024-07-19T17:28:22.380772",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Trips per Month by User Type\n",
    "\n",
    "As with the previous graph, this one also displays a heightened frequency of trips taken by members than by casual users. We can also note the general upward trend of usage around the summer months when the weather would be warmer, and more adequate for daily cycling."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "db96e4db",
   "metadata": {
    "_cell_guid": "7feaf289-ab15-4b02-ba49-d173eb358f6c",
    "_uuid": "588adeb1-9754-49f1-aaf3-94da756f9dbc",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:22.435789Z",
     "iopub.status.busy": "2024-07-19T17:28:22.434347Z",
     "iopub.status.idle": "2024-07-19T17:28:23.260652Z",
     "shell.execute_reply": "2024-07-19T17:28:23.258215Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.848445,
     "end_time": "2024-07-19T17:28:23.263492",
     "exception": false,
     "start_time": "2024-07-19T17:28:22.415047",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nQBL/ByNEL34dbjKcAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(average_duration = mean(ride_length_mins), .groups = \"drop_last\") %>% \n",
    "  arrange(member_casual, weekday) %>% \n",
    "  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") +\n",
    "  labs(\n",
    "    title = \"Duration of Trips per Weekday by User Type\",\n",
    "    subtitle = \"Trip Data from January to December 2023\",\n",
    "    x = \"Day of the Week\",\n",
    "    y = \"Trip Duration (Minutes)\" ,\n",
    "    fill = \"User Type\") +\n",
    "  theme_minimal() +\n",
    "  theme(panel.grid.major.x = element_blank()) +\n",
    "  scale_fill_discrete(labels = c(\"casual\" = \"Casual\", \"member\" = \"Member\")) +\n",
    "  scale_y_continuous(breaks = seq(0, max(csv_files_merged_v2$ride_length_mins), by = 5))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a2b521b4",
   "metadata": {
    "_cell_guid": "d764a46d-9c0d-433e-a539-284869d1d33f",
    "_uuid": "db8d8a66-f0b7-4ec6-84f4-c59b6a096bad",
    "papermill": {
     "duration": 0.018296,
     "end_time": "2024-07-19T17:28:23.300616",
     "exception": false,
     "start_time": "2024-07-19T17:28:23.282320",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Duration of Trips per Weekday by User Type\n",
    "\n",
    "This graph shows us another side of the story. Though we previously saw that member users took trips more frequently, it is clear that casual users are taking much longer trips on average. Nearly double the amount of time spent on a trip during the weekend days of Saturday and Sunday. We are beginning to see another pattern that may help us to understand casual user's usage habits. We can investigate further down below."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "799071a0",
   "metadata": {
    "_cell_guid": "256f3b18-ff3a-4ab9-bebf-a443858b0e3b",
    "_uuid": "1da548f1-544b-4d39-b7b3-43daa5682702",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:23.339461Z",
     "iopub.status.busy": "2024-07-19T17:28:23.338128Z",
     "iopub.status.idle": "2024-07-19T17:28:24.170621Z",
     "shell.execute_reply": "2024-07-19T17:28:24.167968Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.854898,
     "end_time": "2024-07-19T17:28:24.173693",
     "exception": false,
     "start_time": "2024-07-19T17:28:23.318795",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\npPvi/Y/biNsyqqaI5KqyxEphtrT84NwCk05xci//+Y6zj5qOufPZ27VExKtYv/i/2in1JZH4\nYKeq6sD8HjqD54XI2PilodcWiEiRtttUNXGws+N5TzrG4reqM/TbqMe1H/yiS6pn+fEB1L8+\n76foRwfw9vy3aouI0bX0pchYVVU/Ke0rIiNPPQlY4bfXiohrwKtWWk5rsEt1ANj3PCaU0vBO\nteO2DD/bKwcAR9BgsIt6eEBEFJ2LZdL2YOca0DHRv7lnvxnctm3b93dcTTjz/rlhIlKw2XbL\nZKrB7rV87iLy7q83EjYSE34in0mv6JyPPO6F5U+1q/8r0Qn/NpkjfY06vSlfSofCxsbtG+yS\nHqhkg11gsy+fXivu7SAvEem484qqqsVdjCJyJuLJtavo0MPjx4+fMm2jlcJsaXlpvbwi8uae\na0+tYo7pnttNRBZeD7Xel0QSBrt/Z9cSkfY7rsQv/eO9CiLy7rG7apJgZ8fznlKwc/FrE/XU\nVlFeBp3BJchKdywHsFDrb5+e/egANl93TlXV8+ubiUjRV7fHL/5zTCURqfHpUSstpzXYpToA\n7HseE0ppeKfacVuGn+2VA4AjaO8eOzHH3BERvVPetG5YsM3ARIejaLeZGzZsmNI4X/ycqHuX\n1s75n+1txkWeX3o9zOBS9JPauRPON7iUmlbeXzVHTj/7IOH8Qu2HGRPegq+Y8hj1oiZ/k3Za\nG7eXpAcqWS/Pavv0DN2wWTVE5LcZJ0Tk5XxuIvLCK4O3HjgerYqIGN0qjRs37v2hbTLWsnni\nodt6o/+MBk8PAMXwVofCIrJi71N3cdnYF4ui3ceIyL4RW+PnfLz0rMElaFKS97w49Lw/2ard\ncKentnLyM+jEhjv6X5320tMzHh3Av2cdF5ECTac765TLW0fEPm5q/IJTimL49PWSqTdts9QG\ngAPPY0ps7Lj1gZ3WygHAvjQY7KIf7hcRo3uFtG7oUzWZ17DFhl9YNntSny6v1K9RKTC3t7Nv\noddm/ZuGYkJ+i1NVZ5/mhiRPTBZvlFtELh67n3Cmd3lvxzVuL8keqKRa53ZNNMe30vMi8vDU\nSREZs/PrxsW9L2yb/1Kdsu6euWs2aj10wsyfTwZnsOW4yPPnI2PjYu446xJ/r0CtecdE5OHx\np+5zt7EvFs4+Lfrmcbvz94hr0WYRibi9ct2d8Lz1p7kleYmMQ897PL9qfunYSkTapnAAw6+e\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, year, month) %>% \n",
    "  summarise(average_duration = mean(ride_length_mins), .groups = \"drop_last\") %>% \n",
    "  arrange(member_casual, year) %>% \n",
    "  ggplot(aes(x = month, y = average_duration, fill = member_casual)) + \n",
    "  geom_col(position = \"dodge\") +\n",
    "  labs(\n",
    "    title = \"Duration of Trips per Month by User Type\",\n",
    "    subtitle = \"Trip Data from January to December 2023\",\n",
    "    x = \"Month\",\n",
    "    y = \"Trip Duration (Minutes)\" ,\n",
    "    fill = \"User Type\") +\n",
    "  theme_minimal() +\n",
    "  theme(panel.grid.major.x = element_blank()) +\n",
    "  scale_fill_discrete(labels = c(\"casual\" = \"Casual\", \"member\" = \"Member\")) +\n",
    "  scale_y_continuous(breaks = seq(0, max(csv_files_merged_v2$ride_length_mins), by = 5))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "182a5f8e",
   "metadata": {
    "_cell_guid": "260ef665-afbc-42b3-9fb0-dd98a8356b52",
    "_uuid": "dcb28f8e-4e5f-48dc-aa9f-a2cfd2c013f1",
    "papermill": {
     "duration": 0.018275,
     "end_time": "2024-07-19T17:28:24.210800",
     "exception": false,
     "start_time": "2024-07-19T17:28:24.192525",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Duration of Trips per Month by User Type\n",
    "\n",
    "Here is another supporting graph, driving the point further regarding the differences in trip duration between casual and member user types. We also see the same upward trend as before occurring during the summer months of warmer weather. Casual users are taking longer rides on average than member users."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "809136ea",
   "metadata": {
    "_cell_guid": "58be2ff6-7a92-4b58-90ce-be06d56e65e8",
    "_uuid": "75d2782f-11f3-42ea-92ab-43d4ea9710c4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:24.251071Z",
     "iopub.status.busy": "2024-07-19T17:28:24.249676Z",
     "iopub.status.idle": "2024-07-19T17:28:24.264268Z",
     "shell.execute_reply": "2024-07-19T17:28:24.262802Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.037503,
     "end_time": "2024-07-19T17:28:24.266934",
     "exception": false,
     "start_time": "2024-07-19T17:28:24.229431",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "generate_time_labels <- function(start, end, bin_width) {\n",
    "  bins <- seq(start, end, by = bin_width)\n",
    "  labels <- paste(bins[-length(bins)], bins[-1] - 1, sep = \"-\")\n",
    "  return(labels) }\n",
    "\n",
    "time_labels <- generate_time_labels(0, 24, 2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4348f98f",
   "metadata": {
    "_cell_guid": "c259ead6-5896-4116-808f-870d84fbdab4",
    "_uuid": "b445793c-496a-45ea-9e5c-4dcabf6bad40",
    "papermill": {
     "duration": 0.019037,
     "end_time": "2024-07-19T17:28:24.305100",
     "exception": false,
     "start_time": "2024-07-19T17:28:24.286063",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Finally, for our last data visualisation we will create a histogram plotting the number of trips against the hour of the day for casual and member users. Before this we first need to create a function to calculate bin widths, and subsequently format labels for them."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "a9bc208c",
   "metadata": {
    "_cell_guid": "0ca7ba49-3fa4-48f3-aa25-df0e4deeb595",
    "_uuid": "6166d24d-7ee2-4b2a-99b3-69b1f6f470ce",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:24.345176Z",
     "iopub.status.busy": "2024-07-19T17:28:24.343863Z",
     "iopub.status.idle": "2024-07-19T17:28:29.292633Z",
     "shell.execute_reply": "2024-07-19T17:28:29.290017Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 4.972037,
     "end_time": "2024-07-19T17:28:29.295853",
     "exception": false,
     "start_time": "2024-07-19T17:28:24.323816",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nxP8DUuz1XtjEDJYAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "csv_files_merged_v2 %>% \n",
    "  ggplot(aes(x = time_started_at, fill = member_casual)) + \n",
    "  geom_histogram(binwidth = 2, position = \"dodge\", boundary = 0) + \n",
    "  labs(\n",
    "    title = \"Trips per Hour by User Type\",\n",
    "    subtitle = \"Trip Data from January to December 2023\",\n",
    "    x = \"Hour of the Day (24hr-time)\",\n",
    "    y = \"Number of Trips\",\n",
    "    fill = \"User Type\") +\n",
    "  scale_y_continuous(labels = label_number(accuracy = 1)) +\n",
    "  scale_x_continuous(breaks = seq(0, 23, by = 2) + 1, labels = time_labels) +\n",
    "  theme_minimal() +\n",
    "  theme(panel.grid.major.x = element_blank(),\n",
    "        panel.grid.minor.x = element_blank()) +\n",
    "  scale_fill_discrete(labels = c(\"casual\" = \"Casual\", \"member\" = \"Member\")) +\n",
    "  facet_grid(weekday ~ ., scales = \"free_x\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "108f189f",
   "metadata": {
    "_cell_guid": "d2dd7ee4-04f8-4a70-aa7b-1e7ceb00a4a7",
    "_uuid": "85219987-617e-4126-b2d2-f1d12dcb4653",
    "papermill": {
     "duration": 0.019841,
     "end_time": "2024-07-19T17:28:29.336332",
     "exception": false,
     "start_time": "2024-07-19T17:28:29.316491",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Trips per House by User Type\n",
    "\n",
    "Here we have more evidence of the differences in usage habits. These are a set of 7 histograms plotting trips per hour of the day, spread across every day of the week for casual and member user types. We can clearly see spikes around the morning hours of 6:00 - 7:59, and then again during the times of 14:00 - 15:59 and 16:00 - 17:59. These spikes however, exist only in the usage data for member users. This gives us solid confirmation that members do indeed use the bike-sharing program primarily for commuting purposes. Casual users on the other hand show little fluctuation in usage aside from the very early morning hours. However we can again examine their preference for using the bike-sharing program during the weekend due to the higher overall usage throughout the day."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4dd8af16",
   "metadata": {
    "_cell_guid": "85fb0edf-f8c7-482f-820b-875627517ccd",
    "_uuid": "d2728968-e1e0-49de-a50b-47313032bdb1",
    "papermill": {
     "duration": 0.019519,
     "end_time": "2024-07-19T17:28:29.375352",
     "exception": false,
     "start_time": "2024-07-19T17:28:29.355833",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Exporting summary .csv files for further analysis"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "90162bbd",
   "metadata": {
    "_cell_guid": "54f36442-a468-4a1b-bd89-853435191626",
    "_uuid": "7459ffc6-b288-4419-8b40-e3e3627ae595",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2024-07-19T17:28:29.417979Z",
     "iopub.status.busy": "2024-07-19T17:28:29.416509Z",
     "iopub.status.idle": "2024-07-19T17:28:30.379912Z",
     "shell.execute_reply": "2024-07-19T17:28:30.378219Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.98781,
     "end_time": "2024-07-19T17:28:30.382789",
     "exception": false,
     "start_time": "2024-07-19T17:28:29.394979",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "trips_per_hour_by_weekday <- csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, weekday, time_started_at) %>% \n",
    "  summarise(number_of_rides = n(), .groups = \"drop_last\")\n",
    "\n",
    "write_csv(trips_per_hour_by_weekday, \"trips_per_hour_by_weekday.csv\")\n",
    "\n",
    "user_share_by_total_duration <- csv_files_merged_v2 %>% \n",
    "  group_by(member_casual) %>% \n",
    "  summarise(total_usage_secs = sum(ride_length_mins), .groups = \"drop_last\")\n",
    "\n",
    "write_csv(user_share_by_total_duration, \"user_share_by_total_duration.csv\")\n",
    "\n",
    "user_share_by_number_of_rides <- csv_files_merged_v2 %>% \n",
    "  group_by(member_casual) %>% \n",
    "  summarise(number_of_rides = n(), .groups = \"drop_last\")\n",
    "\n",
    "write_csv(user_share_by_number_of_rides, \"user_share_by_number_of_rides.csv\")\n",
    "\n",
    "avg_ride_length_weekly <- csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(average_duration = mean(ride_length_mins), .groups = \"drop_last\")\n",
    "\n",
    "write_csv(avg_ride_length_weekly, \"avg_ride_length_weekly.csv\")\n",
    "\n",
    "avg_ride_length_monthly <- csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, month) %>% \n",
    "  summarise(average_duration = mean(ride_length_mins), .groups = \"drop_last\")\n",
    "\n",
    "write_csv(avg_ride_length_monthly, \"avg_ride_length_monthly.csv\")\n",
    "\n",
    "ride_counts_weekly <- csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n(), .groups = \"drop_last\")\n",
    "\n",
    "write_csv(ride_counts_weekly, \"ride_counts_weekly.csv\")\n",
    "\n",
    "ride_counts_monthly <- csv_files_merged_v2 %>% \n",
    "  group_by(member_casual, month) %>% \n",
    "  summarise(number_of_rides = n(), .groups = \"drop_last\")\n",
    "\n",
    "write_csv(ride_counts_monthly, \"ride_counts_monthly.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "22d0c716",
   "metadata": {
    "_cell_guid": "4a14794a-8a76-4690-b7de-d246cf9e5d31",
    "_uuid": "57dce42f-800f-4613-bd4e-60c04d3070ca",
    "papermill": {
     "duration": 0.020637,
     "end_time": "2024-07-19T17:28:30.423881",
     "exception": false,
     "start_time": "2024-07-19T17:28:30.403244",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Conclusion\n",
    "\n",
    "We can conclude the data analysis portion of this project by summarising our insights into a few key points:\n",
    "\n",
    "1. Members took nearly twice as many trips as Casual users did in 2023\n",
    "2. Members take more trips during the weekdays than Casual users do, who take the most trips during the weekend.\n",
    "3. Members' ridership peaks during the hours of 6:00 to 7:59, and then again from 14:00 to 17:59, whereas Casual users' ridership does not fluctuate much throughout the day\n",
    "4. Casual users take the longest trips overall, with their average trip lasting 22 minutes, compared to the average of 12 minutes taken by Members.\n",
    "5. Overall trip duration and ridership for both Casual and Member users increases between May - Oct, indicating a preference for bicycle usage during the warmer, summer period. \n",
    "\n",
    "These insights will be used to formulate a few final recommendations below."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2e7b3a25",
   "metadata": {
    "_cell_guid": "ce7e1b06-5ec9-457f-8bef-781080f4ea6d",
    "_uuid": "6223b4cb-109a-4cbb-8581-e53cb5e3b2ce",
    "papermill": {
     "duration": 0.020466,
     "end_time": "2024-07-19T17:28:30.463733",
     "exception": false,
     "start_time": "2024-07-19T17:28:30.443267",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Final Recommendations\n",
    "\n",
    "The objective of this project was to leverage Cyclistic's historical trip data from 2023 to help understand the differences in usage between their casual and member users, with the eventual goal of making recommendations for a marketing strategy to convert casual riders into annual members.\n",
    "\n",
    "Based on this analysis, it is evident that Cyclistic casual users predominantly utilise the service for recreational and leisure purposes, particularly during the weekends and warmer summer months. To encourage these users to transition to annual memberships, we recommend targeting their commuting behaviour by promoting the service as a viable alternative for daily transportation. By integrating Cyclistic into their routine commuting habits, users are more likely to align with the engagement patterns of annual members. This strategic approach will not only enhance the perceived value of the service but also foster a stronger, more consistent commitment to an annual membership.\n",
    "\n",
    "# Further Analysis with Additional Data\n",
    "\n",
    "Additional data could further refine this analysis by integrating personal details with each ride, enabling a comparative assessment of average ride frequency between casual users and members. This deeper insight could reveal potential cost savings for casual users if they were to switch to a membership plan, rather than paying per ride. Such analysis could provide valuable information on how to incentivise casual users to transition to an annual membership."
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 5416638,
     "sourceId": 8992836,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30749,
   "isGpuEnabled": false,
   "isInternetEnabled": false,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.4.0"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 118.288451,
   "end_time": "2024-07-19T17:28:30.703586",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-07-19T17:26:32.415135",
   "version": "2.6.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
