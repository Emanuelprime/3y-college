import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  final List<String> _imageUrls = const [
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/300',
    'https://picsum.photos/id/1/200/3000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nossa Galeria'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, semanticLabel: 'Informações da Galeria'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Galeria de imagens aleatórias.')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: _imageUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 colunas
            crossAxisSpacing: 10, // Espaço horizontal entre as imagens
            mainAxisSpacing: 10, // Espaço vertical entre as imagens
            childAspectRatio: 1.0, // Proporção 1:1 (quadrado)
          ),
          itemBuilder: (context, index) {
            final imageUrl = _imageUrls[index];
            return GridImageCard( // Widget customizado para o item da grade
              imageUrl: imageUrl,
              index: index,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Clicou na imagem $index')),
                );
                // Futuramente: Navegar para tela de detalhes da imagem
              },
            );
          },
        ),
      ),
    );
  }
}

// Widget customizado para um item da grade
class GridImageCard extends StatelessWidget {
  final String imageUrl;
  final int index;
  final VoidCallback onTap;

  const GridImageCard({
    super.key,
    required this.imageUrl,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  semanticLabel: 'Imagem de galeria número ${index + 1}', // Acessibilidade!
                  loadingBuilder: (context, child, loadingProgress) {
  if (loadingProgress == null) return child;
  double? progress;
  if (loadingProgress.expectedTotalBytes != null) {
    progress = loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!;
  }
  return Center(
    child: CircularProgressIndicator(
      value: progress,
    ),
  );
},
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.broken_image, color: Colors.grey[600], size: 50),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.photo_library, size: 18),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      'Foto ${index + 1}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

