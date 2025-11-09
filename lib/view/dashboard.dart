import 'package:flutter/material.dart';
import 'qrcode.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key}); //classe principal do dashboard de campanhas

  @override
  Widget build(BuildContext context) { //método build que constrói a interface gráfica do dashboard, utilizando Scaffold, AppBar e ListView
    final campanhas = [ //lista de campanhas de doação com título, descrição e imagem sendo exibidas na tela de forma estatica 
      {
        "titulo": "Ajude a Educação Infantil",
        "descricao":
            "Contribua para a compra de materiais escolares e brinquedos educativos para crianças carentes.",
        "imagem": "images/doacao.jpg"
      },
      {
        "titulo": "Combate à Fome",
        "descricao":
            "Participe desta campanha que distribui cestas básicas para famílias em situação de vulnerabilidade.",
        "imagem": "images/doacao.jpg"
      },
      {
        "titulo": "Proteção Animal",
        "descricao":
            "Ajude abrigos que cuidam de cães e gatos abandonados com ração, medicamentos e castração.",
        "imagem": "images/doacao.jpg"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Campanhas de Doação"), //título da barra de navegação do dashboard
        centerTitle: true,
      ),
      body: ListView.builder( //constrói uma lista rolável de campanhas de doação
        itemCount: campanhas.length,
        itemBuilder: (context, index) {
          final campanha = campanhas[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  campanha["imagem"]!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                campanha["titulo"]!,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                campanha["descricao"]!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push( //navegação para a tela de geração de QR Code ao clicar em uma campanha
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrApiExample(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
