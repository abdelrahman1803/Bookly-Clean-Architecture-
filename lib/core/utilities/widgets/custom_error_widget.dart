import 'package:flutter/material.dart';

class CustomErrorWidget extends StatefulWidget {
  final String title;
  final String? errMessage;
  final VoidCallback? onRetry;
  final String retryText;
  final Widget? icon;
  final Color backgroundColor;
  final Color accentColor;
  final EdgeInsetsGeometry padding;
  final double maxWidth;
  final int retryDelaySeconds;

  const CustomErrorWidget({
    super.key,
    this.title = "An Error Occurred",
    required this.errMessage,
    this.onRetry,
    this.retryText = "Retry",
    this.icon,
    this.backgroundColor = const Color(0xFF2C2C2C),
    this.accentColor = const Color.fromARGB(255, 255, 61, 61),
    this.padding = const EdgeInsets.all(16.0),
    this.maxWidth = 500,
    this.retryDelaySeconds = 10,
  });

  @override
  State<CustomErrorWidget> createState() => _CustomErrorWidgetState();
}

class _CustomErrorWidgetState extends State<CustomErrorWidget> {
  int _retryCountdown = 0;
  bool _isRetrying = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleRetry() {
    if (_isRetrying) return;

    setState(() {
      _isRetrying = true;
      _retryCountdown = widget.retryDelaySeconds;
    });

    // Call the retry callback
    widget.onRetry?.call();

    // Start countdown timer
    Future.delayed(Duration(seconds: 1), () {
      _startCountdown();
    });
  }

  void _startCountdown() {
    if (_retryCountdown > 0) {
      setState(() {
        _retryCountdown--;
      });
      Future.delayed(Duration(seconds: 1), _startCountdown);
    } else {
      if (mounted) {
        setState(() {
          _isRetrying = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;

    // Calculate responsive icon size based on available space
    final availableHeight = screenHeight * 0.35;
    final iconSize = (availableHeight * 0.15).clamp(24.0, 44.0);
    final containerSize = (iconSize * 1.8).clamp(40.0, 88.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: screenHeight * 0.35,
          maxWidth: widget.maxWidth,
        ),
        child: Center(
          child: Container(
            color: widget.backgroundColor,
            alignment: Alignment.center,
            padding: widget.padding,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon or Image - Responsive
                  if (widget.icon != null)
                    SizedBox(height: containerSize, child: widget.icon)
                  else
                    Container(
                      height: containerSize,
                      width: containerSize,
                      decoration: BoxDecoration(
                        color: widget.accentColor.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.error_outline,
                        size: iconSize,
                        color: widget.accentColor,
                      ),
                    ),

                  SizedBox(height: availableHeight * 0.05),

                  // Title
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: (availableHeight * 0.05).clamp(14.0, 18.0),
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: availableHeight * 0.025),

                  // Message
                  Text(
                    widget.errMessage!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[300],
                      fontSize: (availableHeight * 0.04).clamp(12.0, 14.0),
                      height: 1.35,
                    ),
                  ),

                  SizedBox(height: availableHeight * 0.05),

                  // Retry button with loading indicator
                  if (widget.onRetry != null)
                    ElevatedButton(
                      onPressed: _isRetrying ? null : _handleRetry,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: widget.accentColor,
                        disabledBackgroundColor: widget.accentColor.withValues(
                          alpha: 0.5,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isRetrying
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(
                              widget.retryText,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
