# get the current date
current_date=$(date +%s)

# Iterate through merged branches
for branch in $(git branch --merged | cut -c 3-); do
# get the last commit date of the branch
last_commit_date=$(git log -1 --format=%ct "$branch")
# calculate the time difference in seconds
time_difference=$((current_date - last_commit_date))
# calculate three months in seconds (assuming 30 days in a month)
three_months=$((30 * 24 * 60 * 60 * 3))
# check if the branch hasn't been updated in the last three months
if [ "$time_difference" -gt "gt "$three_months" ]; then
	# delete the branch
fi
done
