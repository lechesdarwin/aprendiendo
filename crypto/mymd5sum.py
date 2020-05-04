import hashlib


def sum_md5(byte):
    return hashlib.md5(byte).hexdigest()


def return_sum(namefile):
    return sum_md5(open(namefile, "rb").read())


def main():
    # option = 0
    while True:
        print("-" * 20)
        name = input(">>> ")
        print(return_sum(name))
        print("-" * 20)


main()
