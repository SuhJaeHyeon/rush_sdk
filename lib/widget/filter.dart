import 'package:flutter/material.dart';
import 'package:rush_sdk/app/theme/app_colors.dart';
import 'package:rush_sdk/app/theme/app_styles.dart';

class Filter<T> extends StatelessWidget {
  const Filter({
    super.key,
    required this.selected,
    required this.onTap,
    required this.values,
  });

  final T? selected;
  final void Function(T selected) onTap;
  final Iterable<FilterTicker<T>> values;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 34,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: values.length,
          itemBuilder: (context, index) {
            var ticker = values.elementAt(index);
            return _TickerWidget(
              isSelected: ticker.value == selected,
              ticker: ticker,
              onTap: () => onTap(ticker.value),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        ));
  }
}

class FilterTicker<T> {
  final String label;
  final T value;

  FilterTicker({
    required this.label,
    required this.value,
  });
}

class _TickerWidget<T> extends StatelessWidget {
  const _TickerWidget({
    required this.isSelected,
    required this.ticker,
    required this.onTap,
  });

  final bool isSelected;
  final FilterTicker<T> ticker;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          color: isSelected ? AppColors.primaryBlack : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1,
                color: isSelected ? AppColors.primaryBlack : AppColors.grey08),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ticker.label,
              style: AppTextStyle.text14.copyWith(
                color: isSelected ? Colors.white : AppColors.grey13,
                fontWeight: FontWeight.w500,
                height: 1.15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
