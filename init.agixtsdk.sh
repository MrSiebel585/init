#!/bin/bash
# init.agixtsdk.sh
# Script to install agixtsdk and provide a refactored usage example

echo "Installing agixtsdk package..."
pip install agixtsdk

echo "Refactored usage example for agixtsdk:"

cat << 'EOF'
# Python usage example for AGiXTSDK

from agixtsdk import AGiXTSDK

def create_api_client(base_uri: str, api_key: str) -> AGiXTSDK:
    """
    Create and return an AGiXTSDK API client instance.

    Args:
        base_uri (str): The base URI of the AGiXT API server.
        api_key (str): Your AGiXT API key.

    Returns:
        AGiXTSDK: Configured API client instance.
    """
    return AGiXTSDK(base_uri=base_uri, api_key=api_key)

if __name__ == "__main__":
    BASE_URI = "http://localhost:7437"
    API_KEY = "your_agixt_api_key"

    api_client = create_api_client(BASE_URI, API_KEY)

    # Now you can use api_client to interact with the AGiXT API
    print("AGiXTSDK client created successfully.")
EOF
