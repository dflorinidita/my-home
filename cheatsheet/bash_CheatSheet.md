## Variables and Parameter Expansion
- **Length of a String:** `${#var}`
- **Substring Extraction:** `${var:position:length}`
- **Default Value:** `${var:-default}`
- **Replace Part of String:** `${var/pattern/replacement}`
- **Uppercase Conversion:** `${var^^}`
- **Lowercase Conversion:** `${var,,}`



## Enhanced Control Structures

### If, Elif, Else
- **Conditional Checks:**
  ```
  if [[ $var1 -eq 10 && $var2 -gt 5 ]]; then
    echo "Condition 1 met"
  elif [[ $var1 -lt 10 || $var3 == "yes" ]]; then
    echo "Condition 2 met"
  else
    echo "No condition met"
  fi
  ```
- **File Testing:**
  ```
  if [[ -f "$filename" ]]; then
    echo "$filename exists."
  fi
  ```

### For Loop
- **Iterating Over a Sequence:**
  ```
  for i in {1..5}; do
    echo "Number $i"
  done
  ```
- **Iterating Over Strings:**
  ```
  for name in Alice Bob Charlie; do
    echo "Hello, $name!"
  done
  ```
- **Nested Loops:**
  ```
  for i in {1..3}; do
    for j in {A..C}; do
      echo "i=$i, j=$j"
    done
  done
  ```

### While Loop
- **Standard While Loop:**
  ```
  while [[ $count -lt 10 ]]; do
    echo "Count: $count"
    ((count++))
  done
  ```
- **Reading from a File:**
  ```
  while read -r line; do
    echo "$line"
  done < input.txt
  ```

### Until Loop
- **Usage Example:**
  ```
  until [[ $var -eq 0 ]]; do
    echo "Variable: $var"
    ((var--))
  done
  ```

### Case Statement
- **Matching Patterns:**
  ```
  case $answer in
    [yY]|[yY][eE][sS])
      echo "You answered yes."
      ;;
    [nN]|[nN][oO])
      echo "You answered no."
      ;;
    *)
      echo "Invalid answer."
      ;;
  esac
  ```

### Select Loop (Menu Driven)
- **Creating a Simple Menu:**
  ```
  select choice in "Option 1" "Option 2" "Quit"; do
    case $REPLY in
      1) echo "Selected Option 1";;
      2) echo "Selected Option 2";;
      3) break;;
      *) echo "Invalid selection.";;
    esac
  done
  ```


## Functions
- **Function with Return Value:**
  ```
  function_name() {
    local result="Some result"
    echo "$result"
  }
  returnValue=$(function_name)
  ```
- **Recursive Function:**
  ```
  recursive_function() {
    # logic here
    recursive_function # call itself
  }
  ```

## Arrays
- **Associative Array (Dict):** `declare -A assoc_array`
- **List All Array Keys:** `${!array[@]}`
- **Array Length:** `${#array[@]}`

## File and Directory Operations
- **Creating Temporary Files and Directories:** `tempfile=$(mktemp)`, `tempdir=$(mktemp -d)`
- **Redirecting stderr and stdout:** `command >file 2>&1`
- **Reading a File Into an Array:** `mapfile -t array < file`

## Process Handling
- **Sending a Signal to a Process:** `kill -SIGNAL PID`
- **Waiting for a Process to Finish:** `wait PID`
- **Backgrounding a Process:** `command &`
- **Foregrounding a Job:** `fg %jobnumber`

## String Manipulation
- **Regular Expressions with `=~`:**
  ```
  if [[ $var =~ ^[a-zA-Z]+$ ]]; then
    echo "var is alphabetic"
  fi
  ```

## Debugging
- **Tracing Execution:** `set -x` and `set +x`
- **Printing Shell Input Lines:** `set -v`
- **Use Bash Strict Mode:** `set -euo pipefail`
## Setting IFS
```
IFS=$'\n\t'
```
```
#!/bin/bash
names=(
  "Aaron Maxwell"
  "Wayne Gretzky"
  "David Beckham"
  "Anderson da Silva"
)

echo "With default IFS value..."
for name in ${names[@]}; do
  echo "$name"
done

echo ""
echo "With strict-mode IFS value..."
IFS=$'\n\t'
for name in ${names[@]}; do
  echo "$name"
done
```
This is the output:
```
With default IFS value...
Aaron
Maxwell
Wayne
Gretzky
David
Beckham
Anderson
da
Silva

With strict-mode IFS value...
Aaron Maxwell
Wayne Gretzky
David Beckham
Anderson da Silva
```

## Best Practices
- **Double Quote to Prevent Globbing and Word Splitting:** Always use `"${var}"`
- **Check if Command Succeeded:** `if command; then ...` or `command || { echo "error"; exit 1; }`
- **Use Functions to Encapsulate Logic**
- **Prefer `[[ ]]` Over `[ ]` for Test/Conditional Expressions**

## Tips and Tricks
- **Here Documents for Multi-line Input:**
  ```
  cat <<EOF >file.txt
  Line 1
  Line 2
  Line 3
  EOF
  ```
- **Reading Input with a Timeout:** `read -t TIMEOUT VAR`
  ```
  echo "Enter your name (you have 5 seconds):"
  if read -t 5 name; then
    echo "Hello, $name"
  else
    echo "Sorry, you did not respond in time."
  fi
  ```
