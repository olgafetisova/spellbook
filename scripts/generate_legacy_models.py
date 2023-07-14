import os
import re
import sys

"""
This is a script to help batch create legacy models. It takes a list of models 
from stdin and creates a *_legacy.sql file for each model. 
It also replaces all refs to the original model with refs to the legacy model in all other models.

When we migrate a model, we have to migrate it's upstream lineage as well. (--select +nodel_name)

example usage:
dbt ls --resource-type model --output path --select +tokens_nft | python scripts/generate_legacy_models.py

"""

def make_legacy_file(model):
    """
    Copy the current model to *_legacy.sql
    """
    print(f"Creating legacy model...")
    destination_path = model_path.replace(".sql", "_legacy.sql")

    # check if destination file already exists
    if os.path.exists(destination_path):
        print(f"!!! {destination_path} already exists, skipping !!!")
        return

    # open original model as found in public repo
    with open(model_path, 'r') as f:
        model_contents = f.read()

    # replace alias with legacy alias macro
    model_contents = replace_with_alias_macros(model_contents)

    model_contents = replace_with_legacy_ref(model_contents)

    # create new file with _legacy.sql suffix in same folder as original
    with open(destination_path, 'w') as f:
        f.write(model_contents)

    print(f"Legacy model created at  {model}")


def replace_with_alias_macros(model_contents):
    """
    Replace alias = 'some_alias' with alias('some_alias', legacy_model=True)
    """
    pattern = r"alias\s*=\s*'([^']*)'"
    # replace alias with legacy alias
    transformation_string = "alias = alias('\\1', legacy_model=True)"
    return re.sub(pattern, transformation_string, model_contents)


def replace_with_legacy_ref(model_contents):
    """
    Replace ref('some_ref') with ref('some_ref_legacy')
    """
    pattern = r"ref\s*\(\s*'([^']*)'\s*\)"
    # replace alias with legacy alias
    transformation_string = f"ref('\\1_legacy')"
    return re.sub(pattern, transformation_string, model_contents)

def run():
    # get current working dir
    cwd = os.getcwd()
    # get model paths from stdin
    model_names = []  # list of models to later replace refs
    # for path in ["models/zeroex/zeroex_native_trades.sql"]:
    for path in sys.stdin.read().splitlines():
        model_path = cwd + '/' + path
        if path.startswith("models/") and not path.endswith('_legacy.sql') and not os.path.exists(model_path.replace(".sql", "_legacy.sql")):
            make_legacy_file(model_path)
            model_names.append(model_path.split("/")[-1].replace(".sql", ""))

def clean_up():
    for root, dirs, files in os.walk('models'):
        for file_name in files:
            if file_name.endswith('.sql'):
                file_path = os.path.join(root, file_name)
                with open(file_path, 'r', newline='') as file:
                    content = file.read()
                content = content.replace("_legacy_legacy", "_legacy")
                with open(file_path, 'w', newline='') as file:
                    file.write(content)
                print(f"Updated {file_path}")

if __name__ == "__main__":
    # run()

    clean_up()
    
