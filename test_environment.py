import sys

REQUIRED_PYTHON = "python3"


def main():
    system_major = sys.version_info.major
    print("Using interpreter: " + sys.executable)
    if REQUIRED_PYTHON == "python":
        required_major = 2
    elif REQUIRED_PYTHON == "python3":
        required_major = 3
    else:
        raise ValueError("Unrecognized python interpreter: {}".format(
            REQUIRED_PYTHON))

    if system_major != required_major:
        raise TypeError(
            "This project requires Python {}. Found: Python {}".format(
                required_major, sys.version))
    # check to see if the venv is running https://stackoverflow.com/a/58026969
    if sys.prefix == sys.base_prefix:
        raise ModuleNotFoundError("venv not activated. " +
        "Please first activate venv for project via `source activate.sh`.\n" +
        "To debug, after activating venv, use `which python` to get interpreter path " + 
        "to add VS code via https://code.visualstudio.com/docs/python/environments.")
    
    # print python version
    print(f'python version  == {sys.version}')
    
    # test pytorch
    print("## Testing PyTorch.")
    import torch
    print("Loaded torch " + torch.__version__ + " with tensorboard.")

    # test tensorboard - uncomment this code block if tensorboard is added to the project
    # print("## Testing pytorch tensorboard")
    from torch.utils.tensorboard import SummaryWriter
    print("imported pytorch tensorboard")
    print(">>> Development environment passes all tests!")

if __name__ == '__main__':
    main()
