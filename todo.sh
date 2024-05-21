#!/bin/bash

todo_file="todo_tasks.txt"

if [[ ! -f "$todo_file" ]]; then
    touch "$todo_file"
fi

# Function to display usage instructions
display_usage() {
    echo "Options:"
    echo "  1. create    Create a new task"
    echo "  2. update    Update an existing task"
    echo "  3. delete    Delete a task"
    echo "  4. show      Show information about a task"
    echo "  5. list      List tasks of the current day"
    echo "  6. search    Search for a task by title"
    echo "  7. help      Display usage instructions"
    echo "  8. exit      Exit the program"
}

# Function to display help menu
display_help() {
    echo "This script helps you manage your todo tasks. Here are the available commands:"
    echo "  create    Create a new task"
    echo "  update    Update an existing task"
    echo "  delete    Delete a task"
    echo "  show      Show information about a task"
    echo "  list      List tasks of the current day"
    echo "  search    Search for a task by title"
    echo "  help      Display this help message"
    echo "  exit      Exit the program"
    echo ""
    echo "You can also use the corresponding numbers to select an option."
}

# Function to create a new task
create_task() {
    echo "Enter task title (required):"
    read title
    if [[ -z $title ]]; then
        echo "Error: Title is required" >&2
        return 1
    fi

    echo "Enter task description:"
    read description

    echo "Enter task location:"
    read location

    while true; do
        echo "Enter due date and time (format: YYYY-MM-DD HH:MM):"
        read due_date_time
        if [[ ! $due_date_time =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})\ ([0-9]{2}):([0-9]{2})$ ]]; then
            echo "Error: Invalid date/time format. Please use YYYY-MM-DD HH:MM" >&2
            continue
        fi
        year=${BASH_REMATCH[1]}
        month=${BASH_REMATCH[2]}
        day=${BASH_REMATCH[3]}
        hour=${BASH_REMATCH[4]}
        minute=${BASH_REMATCH[5]}
        if ! (date -d "$year-$month-$day" > /dev/null 2>&1) || ! (date -d "$hour:$minute" > /dev/null 2>&1); then
            echo "Error: Invalid date or time. Please enter a valid date and time" >&2
        else
            break
        fi
    done

    while true; do
        echo "Enter completion status (Y/N):"
        read completion
        completion=$(echo "$completion" | tr '[:lower:]' '[:upper:]') # Convert to uppercase
        if [[ $completion == "Y" || $completion == "N" ]]; then
            break
        else
            echo "Error: Completion status must be 'Y' or 'N'" >&2
        fi
    done

    # Get the current maximum ID
    max_id=$(awk -F '|' 'BEGIN { max=0 } { if ($1 > max) max = $1 } END { print max }' "$todo_file")

    # Increment the ID by 1
    task_id=$((max_id + 1))

    # Save task information
    echo "$task_id|$title|$description|$location|$due_date_time|$completion" >> "$todo_file"

    echo "Task created successfully with ID: $task_id"
}

# Function to update an existing task
update_task() {
    echo "Enter the ID of the task to update:"
    read task_id
    if [[ -z $task_id ]]; then
        echo "Error: Task ID is required" >&2
        return 1
    fi

    # Check if the task ID exists in the todo_tasks.txt file
    if ! grep -q "^$task_id" "$todo_file"; then
        echo "Error: Task with ID '$task_id' not found" >&2
        return 1
    fi

    # Get the current task information
    task_info=$(grep "^$task_id" "$todo_file")
    old_title=$(echo "$task_info" | cut -d '|' -f 2)
    old_description=$(echo "$task_info" | cut -d '|' -f 3)
    old_location=$(echo "$task_info" | cut -d '|' -f 4)
    old_due_date_time=$(echo "$task_info" | cut -d '|' -f 5)
    old_completion=$(echo "$task_info" | cut -d '|' -f 6)

    echo "Enter new task title (press enter to keep '$old_title'):"
    read title
    if [[ -z $title ]]; then
        title=$old_title
    fi

    echo "Enter new task description (press enter to keep '$old_description'):"
    read description
    if [[ -z $description ]]; then
        description=$old_description
    fi

    echo "Enter new task location (press enter to keep '$old_location'):"
    read location
    if [[ -z $location ]]; then
        location=$old_location
    fi

    while true; do
        echo "Enter new due date and time (format: YYYY-MM-DD HH:MM) (press enter to keep '$old_due_date_time'):"
        read due_date_time
        if [[ -z $due_date_time ]]; then
            due_date_time=$old_due_date_time
            break
        elif [[ ! $due_date_time =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})\ ([0-9]{2}):([0-9]{2})$ ]]; then
            echo "Error: Invalid date/time format. Please use YYYY-MM-DD HH:MM" >&2
            continue
        fi
        year=${BASH_REMATCH[1]}
        month=${BASH_REMATCH[2]}
        day=${BASH_REMATCH[3]}
        hour=${BASH_REMATCH[4]}
        minute=${BASH_REMATCH[5]}
        if ! (date -d "$year-$month-$day" > /dev/null 2>&1) || ! (date -d "$hour:$minute" > /dev/null 2>&1); then
            echo "Error: Invalid date or time. Please enter a valid date and time" >&2
        else
            break
        fi
    done

    echo "Enter new completion status (Y/N) (press enter to keep '$old_completion'):"
    read completion
    if [[ -z $completion ]]; then
        completion=$old_completion
    else
        completion=$(echo "$completion" | tr '[:lower:]' '[:upper:]') # Convert to uppercase
        if [[ $completion != "Y" && $completion != "N" ]]; then
            echo "Error: Completion status must be 'Y' or 'N'" >&2
            return 1
        fi
    fi

    # Update task information in todo_tasks.txt
    sed -i "/^$task_id/s/[^|]*|[^|]*|[^|]*|[^|]*|[^|]*|[^|]*/$task_id|$title|$description|$location|$due_date_time|$completion/" "$todo_file"

    echo "Task with ID '$task_id' updated successfully"
}

# Function to delete a task
delete_task() {
    echo "Enter the ID of the task to delete:"
    read task_id
    if [[ -z $task_id ]]; then
        echo "Error: Task ID is required" >&2
        return 1
    fi

    # Check if the task ID exists in the todo_tasks.txt file
    if ! grep -q "^$task_id" "$todo_file"; then
        echo "Error: Task with ID '$task_id' not found" >&2
        return 1
    fi

    # Delete task from todo_tasks.txt
    sed -i "/^$task_id/d" "$todo_file"

    echo "Task with ID '$task_id' deleted successfully"
}

# Function to show information about a task
show_task() {
    echo "Tasks available for display:"
    awk -F '|' '{print $1}' "$todo_file"

    echo "Enter the ID of the task to show information:"
    read task_id
    if [[ -z $task_id ]]; then
        echo "Error: Task ID is required" >&2
        return 1
    fi

    # Check if the task ID exists in the todo_tasks.txt file
    if ! grep -q "^$task_id" "$todo_file"; then
        echo "Error: Task with ID '$task_id' not found" >&2
        return 1
    fi

    # Display task information
    grep "^$task_id" "$todo_file"
}

# Function to list tasks of a specific day in two sections: completed and uncompleted

list_tasks() {
    echo "Enter the date (format: YYYY-MM-DD) to list tasks for (leave empty for today):"
    read target_date

    # If no date is provided, use today's date
    if [[ -z $target_date ]]; then
        target_date=$(date +'%Y-%m-%d')
    fi

    # Validate the format of the entered date
    if [[ ! $target_date =~ ^([0-9]{4})-([0-9]{2})-([0-9]{2})$ ]]; then
        echo "Error: Invalid date format. Please use YYYY-MM-DD" >&2
        return 1
    fi

    echo "Completed tasks for $target_date:"
    awk -F'|' -v date="$target_date" '$5 ~ date && $6 == "Y" { print $0 }' "$todo_file"

    echo "Uncompleted tasks for $target_date:"
    awk -F'|' -v date="$target_date" '$5 ~ date && $6 == "N" { print $0 }' "$todo_file"
}

# Function to search for a task by title
# Function to search for a task by title
search_task() {
    echo "Enter task title to search:"
    read title
    if [[ -z $title ]]; then
        echo "Error: Title is required" >&2
        return 1
    fi

    # Search for tasks with matching title
    search_results=$(grep -i "$title" "$todo_file")
    if [[ -z $search_results ]]; then
        echo "No tasks found with title containing '$title'."
    else
        echo "$search_results"
    fi
}


# Parse command line arguments
if [[ $# -gt 0 ]]; then
    case $1 in
        create)
            create_task
            exit 0
            ;;
        update)
            update_task
            exit 0
            ;;
        delete)
            delete_task
            exit 0
            ;;
        show)
            show_task
            exit 0
            ;;
        list)
            list_tasks
            exit 0
            ;;
        search)
            search_task
            exit 0
            ;;
        help)
            display_help
            exit 0
            ;;
        *)
            echo "Error: Invalid option '$1'. Use 'help' to see usage instructions." >&2
            display_help
            exit 1
            ;;
    esac
fi

# Main script logic
while true; do
    display_usage
    read -p "Enter option number: " choice

    case $choice in
        1|create)
            create_task
            ;;
        2|update)
            update_task
            ;;
        3|delete)
            delete_task
            ;;
        4|show)
            show_task
            ;;
        5|list)
            list_tasks
            ;;
        6|search)
            search_task
            ;;
        7|help)
            display_help
            ;;
        8|exit)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Error: Invalid option '$choice'. Use 'help' to see usage instructions." >&2
            ;;
    esac
done

