import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/models/item_model.dart'; // Reutiliza seu modelo
import 'package:meu_projeto_integrador/shared/constants/app_spacings.dart';
import 'package:meu_projeto_integrador/shared/widgets/atoms/app_text.dart';
import 'package:meu_projeto_integrador/shared/widgets/molecules/app_card.dart'; // Assumindo que você criou AppCard

class ProductListCardOrganism extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ProductListCardOrganism({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard( // Usando o AppCard (Molécula)
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacings.medium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacings.small),
              child: Image.network(
                item.imageUrl,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                semanticLabel: 'Imagem do produto ${item.nome}', // Acessibilidade
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey[300],
                    child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                  );
                },
              ),
            ),
            const SizedBox(width: AppSpacings.medium),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    item.nome,
                    style: AppTextStyle.titleLarge,
                    isBold: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacings.extraSmall),
                  AppText(
                    'R\$ ${item.preco.toStringAsFixed(2)}',
                    style: AppTextStyle.bodyLarge,
                    color: Colors.green.shade700,
                    isBold: true,
                  ),
                  const SizedBox(height: AppSpacings.small),
                  AppText(
                    item.descricao,
                    style: AppTextStyle.bodyMedium,
                    color: Colors.grey[700],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacings.small),

            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20, semanticLabel: 'Ver detalhes do produto'),
            ),
          ],
        ),
      ),
    );
  }
}
