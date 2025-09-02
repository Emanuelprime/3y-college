import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/models/item_model.dart';
import 'package:meu_projeto_integrador/shared/widgets/organisms/product_list_card_organism.dart.dart'; // Widget customizado para o item

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  // Dados simulados para a lista
  static final List<Item> _itens = [
    Item(
      id: 1,
      nome: 'Smartphone X',
      preco: 1299.99,
      imageUrl: 'https://picsum.photos/id/3/5000/3333', // Imagem de placeholder
      descricao: 'Um smartphone de última geração com câmera incrível.',
    ),
    Item(
      id: 2,
      nome: 'Fone de Ouvido Bluetooth Pro',
      preco: 249.90,
      imageUrl: '',
      descricao: 'Qualidade de áudio impecável e bateria de longa duração.',
    ),
    Item(
      id: 3,
      nome: 'Smartwatch Esportivo 2.0',
      preco: 799.00,
      imageUrl: '',
      descricao: 'Monitore sua saúde e exercícios com estilo.',
    ),
    Item(
      id: 4,
      nome: 'Laptop Ultrafino i7',
      preco: 4500.00,
      imageUrl: '',
      descricao: 'Perfeito para trabalho e jogos, com desempenho superior.',
    ),
    Item(
      id: 5,
      nome: 'Câmera DSLR Profissional',
      preco: 3100.50,
      imageUrl: '',
      descricao: 'Capture momentos inesquecíveis com qualidade profissional.',
    ),
    Item(
      id: 6,
      nome: 'Teclado Mecânico RGB',
      preco: 320.00,
      imageUrl: '',
      descricao: 'Experiência de digitação e jogos incomparável.',
    ),
    Item(
      id: 7,
      nome: 'Monitor Gamer Curvo 27"',
      preco: 1800.00,
      imageUrl: '',
      descricao: 'Imersão total em seus jogos favoritos.',
    ),
    Item(
      id: 8,
      nome: 'Mouse Sem Fio Ergonômico',
      preco: 85.00,
      imageUrl: '',
      descricao: 'Conforto e precisão para longas horas de uso.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Itens'),
      ),
      body: ListView.builder(
        itemCount: _itens.length, // Número total de itens
        itemBuilder: (context, index) {
          final item = _itens[index];
          return ProductListCardOrganism( // Usando o widget de item customizado
            item: item,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Clicou no item: ${item.nome}')),
              );
              // Futuramente: Navegar para a tela de detalhes do item
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ItemDetailScreen(item: item)));
            },
          );
        },
      ),
    );
  }
}
