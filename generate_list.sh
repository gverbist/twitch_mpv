#!/bin/bash

# Check if streamers.list exists
if [[ ! -f streamers.list ]]; then
    echo "streamers.list not found!"
    exit 1
fi

# Read streamers.list line by line
while IFS= read -r streamer; do
    # Create a script for each streamer
    cat <<EOL > "${streamer}.sh"
#!/bin/bash
streamlink --player mpv twitch.tv/${streamer} 1080p60
EOL

    # Make the generated script executable
    chmod +x "${streamer}.sh"
done < streamers.list

echo "Script files created successfully!"

