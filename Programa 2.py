def clasificar_token(token):
    if token.isdigit():
        return "entero"
    elif token.isalpha():
        return "palabra"
    elif any(c.isalpha() for c in token) and any(c.isdigit() for c in token):
        return "compuesta"
    else:
        return "otro"


def main():
   
    while True:
        entrada = input("Ingrese un valor:").strip()
        
        if entrada.lower() == "salir":
            print("Programa terminado.")
            break
        
        tokens = entrada.split()
        conteos = {"entero": 0, "palabra": 0, "compuesta": 0, "otro": 0}
        
        for token in tokens:
            tipo = clasificar_token(token)
            conteos[tipo] += 1
        
        
        salida = []
        if conteos["entero"] > 0:
            salida.append(f"{conteos['entero']} entero" + ("s" if conteos['entero'] > 1 else ""))
        if conteos["palabra"] > 0:
            salida.append(f"{conteos['palabra']} palabra" + ("s" if conteos['palabra'] > 1 else ""))
        if conteos["compuesta"] > 0:
            salida.append(f"{conteos['compuesta']} compuesta" + ("s" if conteos['compuesta'] > 1 else ""))
        if conteos["otro"] > 0:
            salida.append(f"{conteos['otro']} otro")
        
        print(", ".join(salida))
        print()




