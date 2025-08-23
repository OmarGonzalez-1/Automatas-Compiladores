def main():
    archivo = "entrada.txt"
    with open(archivo, "r", encoding="utf-8") as f:
        data = f.read()

    con_espacios = len(data)
    sin_espacios = len(data.replace(" ", "").replace("\n", ""))
    lexemas = data.split()
    total_lexemas = len(lexemas)

    total_num = 0
    total_car = 0
    total_comb = 0

    for x in lexemas:
        if numero(x):
            total_num += 1
        elif caracter(x):
            total_car += 1
        elif combinado(x):
            total_comb += 1

    print("Total de caracteres (con espacios):", con_espacios)
    print("Total de caracteres (sin espacios):", sin_espacios)
    print("Total de lexemas:", total_lexemas)
    print("Total de palabras:", total_car)
    print("Total de números:", total_num)
    print("Total de combinadas:", total_comb)


def numero(txt):
    return txt.isdigit()

def caracter(txt):
    return txt.isalpha()

def combinado(txt):
    tiene_letra = False
    tiene_num = False
    for c in txt:
        if c.isalpha():
            tiene_letra = True
        elif c.isdigit():
            tiene_num = True
    return tiene_letra and tiene_num


main()
