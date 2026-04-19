import type { ReactNode } from "react";
import "./globals.css";

export const metadata = {
  title: "Analizza Properties",
  description: "Analise de leiloes de propriedades"
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="pt-BR">
      <body>{children}</body>
    </html>
  );
}
