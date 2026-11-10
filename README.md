# Ale2026 🐒
Jogo PWA do miquinho com moedas fictícias. Sem dinheiro real.

## 1. Supabase
1. Crie um projeto novo em supabase.com.
2. SQL Editor > cole o conteúdo de `supabase.sql` > Run.
3. Project Settings > API: copie **Project URL** e a chave **anon public**.
4. Cole os dois valores em `config.js`.
5. (Opcional) Authentication > Providers > Email: desligue "Confirm email" para entrar direto após criar a conta.
6. Depois do deploy, em Authentication > URL Configuration, ponha o endereço da Vercel em Site URL.

## 2. GitHub
```
git init
git add .
git commit -m "Ale2026"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/ale2026.git
git push -u origin main
```

## 3. Vercel
Add New > Project > importe o repositório `ale2026`. Framework: **Other**, sem build command. Deploy.

## 4. Instalar no celular
Abra o link no Chrome > menu ⋮ > Instalar app.
