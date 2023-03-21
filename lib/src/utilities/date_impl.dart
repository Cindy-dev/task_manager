library date_time_picker;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../src/utilities/app_constants/app_colors.dart';
import '../../../src/utilities/app_constants/app_strings.dart';

enum TaskManagerDateTimePickerType { date, time, dateTime, dateTimeSeparate }

class TaskManagerDateTime extends FormField<String> {
  TaskManagerDateTime({
    Key? key,
    this.type = TaskManagerDateTimePickerType.date,
    this.controller,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.initialTime,
    this.dateMask,
    this.icon,
    this.dateLabelText,
    this.timeLabelText,
    this.dateHintText,
    this.timeHintText,
    this.calendarTitle,
    this.cancelText,
    this.confirmText,
    this.fieldLabelText,
    this.fieldHintText,
    this.errorFormatText,
    this.errorInvalidText,
    this.initialEntryMode,
    this.initialDatePickerMode,
    this.selectableDayPredicate,
    this.textDirection,
    this.locale,
    this.useRootNavigator = false,
    this.routeSettings,
    this.use24HourFormat = true,
    this.timeFieldWidth,
    this.timePickerEntryModeInput = false,
    String? initialValue,
    FocusNode? focusNode,
    InputDecoration? decoration,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    bool showCursor = false,
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    bool autovalidate = false,
    MaxLengthEnforcement? maxLengthEnforcement,
    int maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    this.onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool enabled = true,
    double cursorWidth = 2.0,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
  })  : assert(initialValue == null || controller == null),
        assert(type == TaskManagerDateTimePickerType.time || firstDate != null),
        assert(type == TaskManagerDateTimePickerType.time || lastDate != null),
        assert(maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(
          !obscureText || maxLines == 1,
          'Obscured fields cannot be multiline.',
        ),
        assert(maxLength == null || maxLength > 0),
        super(
          key: key,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          enabled: enabled,
          builder: (FormFieldState<String> field) {
            final state = field as _DateTimePickerState;

            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            Widget buildField(TaskManagerDateTimePickerType peType) {
              GestureTapCallback lfOnTap;
              TextEditingController loCtrl;
              InputDecoration loDecoration;

              switch (peType) {
                case TaskManagerDateTimePickerType.time:
                  lfOnTap = state._showTimePickerDialog;
                  loCtrl = state._timeLabelController;
                  loDecoration = InputDecoration(
                    labelText: timeLabelText,
                    icon: icon,
                    hintText: timeHintText,
                  );

                  if (type == TaskManagerDateTimePickerType.dateTimeSeparate) {
                    loDecoration = InputDecoration(
                      labelText: timeLabelText,
                      hintText: timeHintText,
                    );
                  }
                  break;
                case TaskManagerDateTimePickerType.dateTime:
                  lfOnTap = state._showDateTimePickerDialog;
                  loCtrl = state._dateLabelController;
                  loDecoration = InputDecoration(
                    labelText: dateLabelText,
                    icon: icon,
                    hintText: dateHintText,
                  );
                  break;
                default:
                  lfOnTap = state._showDatePickerDialog;
                  loCtrl = state._dateLabelController;
                  loDecoration = InputDecoration(
                    labelText: dateLabelText,
                    icon: icon,
                    hintText: dateHintText,
                  );
              }

              loDecoration = decoration ?? loDecoration
                ..applyDefaults(
                  Theme.of(field.context).inputDecorationTheme,
                );
              return TextField(
                readOnly: true,
                onTap: readOnly ? null : lfOnTap,
                controller: loCtrl,
                decoration: InputDecoration(
                    errorStyle: const TextStyle(
                      fontSize: 13,
                      color: AppColors.red,
                      fontFamily: AppStrings.fontName,
                    ),
                    hintText: "Select a Date",
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: AppColors.black,
                      fontFamily: AppStrings.fontName,
                    ),
                    filled: true,
                    fillColor: AppColors.gray.withOpacity(0.3),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: AppColors.gray.withOpacity(0.3))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2, color: AppColors.gray.withOpacity(0.3)))),
                focusNode: focusNode,
                keyboardType: TextInputType.datetime,
                textInputAction: textInputAction,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.black,
                  fontFamily: AppStrings.fontName,
                ),
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textCapitalization: textCapitalization,
                autofocus: autofocus,
                toolbarOptions: toolbarOptions,
                showCursor: showCursor,
                obscureText: obscureText,
                autocorrect: autocorrect,
                smartDashesType: smartDashesType ??
                    (obscureText
                        ? SmartDashesType.disabled
                        : SmartDashesType.enabled),
                smartQuotesType: smartQuotesType ??
                    (obscureText
                        ? SmartQuotesType.disabled
                        : SmartQuotesType.enabled),
                enableSuggestions: enableSuggestions,
                maxLengthEnforcement: maxLengthEnforcement,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                onChanged: onChangedHandler,
                onEditingComplete: onEditingComplete,
                onSubmitted: onFieldSubmitted,
                inputFormatters: inputFormatters,
                enabled: enabled,
                cursorWidth: cursorWidth,
                cursorRadius: cursorRadius,
                cursorColor: cursorColor,
                scrollPadding: scrollPadding,
                scrollPhysics: scrollPhysics,
                keyboardAppearance: keyboardAppearance,
                enableInteractiveSelection: enableInteractiveSelection,
                buildCounter: buildCounter,
              );
            }

            switch (type) {
              case TaskManagerDateTimePickerType.time:
                return buildField(TaskManagerDateTimePickerType.time);
              case TaskManagerDateTimePickerType.dateTime:
                return buildField(TaskManagerDateTimePickerType.dateTime);
              case TaskManagerDateTimePickerType.dateTimeSeparate:
                return Row(children: <Widget>[
                  Expanded(
                      child: buildField(TaskManagerDateTimePickerType.date)),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: timeFieldWidth ?? 100,
                    child: buildField(TaskManagerDateTimePickerType.time),
                  )
                ]);
              default:
                return buildField(TaskManagerDateTimePickerType.date);
            }
          },
        );

  /// The DateTimePicker type:
  /// [date], [time], [dateTime] or [dateTimeSeparate].
  final TaskManagerDateTimePickerType type;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  /// The value need to be a DateTime String or null
  final TextEditingController? controller;

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime? firstDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime? lastDate;

  /// The initial date to be used for the date picker if initialValue is null or empty
  final DateTime? initialDate;

  /// The initial time to be used for the time picker if initialValue is null or empty
  final TimeOfDay? initialTime;

  /// For forms that match one of our predefined skeletons, we look up the
  /// corresponding pattern in [locale] (or in the default locale if none is
  /// specified) and use the resulting full format string. This is the
  /// preferred usage, but if [newPattern] does not match one of the skeletons,
  /// then it is used as a format directly, but will not be adapted to suit the
  /// locale.
  final String? dateMask;

  /// An icon to show before the input field and outside of the decoration's
  /// container.
  ///
  /// The size and color of the icon is configured automatically using an
  /// [IconTheme] and therefore does not need to be explicitly given in the
  /// icon widget.
  ///
  /// The trailing edge of the icon is padded by 16dps.
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [decoration.icon] and above the widgets that contain [helperText],
  /// [errorText], and [counterText].
  ///
  /// See [Icon], [ImageIcon].
  final Widget? icon;

  /// Text that describes the date input field.
  ///
  /// When the date input field is empty and unfocused, the label is displayed on
  /// top of the input field (i.e., at the same location on the screen where
  /// text may be entered in the input field). When the input field receives
  /// focus (or if the field is non-empty), the label moves above (i.e.,
  /// vertically adjacent to) the input field.
  final String? dateLabelText;

  /// Text that describes the time input field.
  ///
  /// When the time input field is empty and unfocused, the label is displayed on
  /// top of the input field (i.e., at the same location on the screen where
  /// text may be entered in the input field). When the input field receives
  /// focus (or if the field is non-empty), the label moves above (i.e.,
  /// vertically adjacent to) the input field.
  final String? timeLabelText;

  /// Text that suggests what sort of date input the field accepts.
  ///
  /// Displayed on top of the date input [child] (i.e., at the same location on the
  /// screen where text may be entered in the input [child]) when the input
  /// [isEmpty] and either (a) [labelText] is null or (b) the input has the focus.
  final String? dateHintText;

  /// Text that suggests what sort of time input the field accepts.
  ///
  /// Displayed on top of the time input [child] (i.e., at the same location on the
  /// screen where text may be entered in the input [child]) when the input
  /// [isEmpty] and either (a) [labelText] is null or (b) the input has the focus.
  final String? timeHintText;

  /// Optional strings for the [cancelText] to override the default text.
  final String? calendarTitle;

  /// Optional strings for the [cancelText] to override the default text.
  final String? cancelText;

  /// Optional strings for the [confirmText] to override the default text.
  final String? confirmText;

  /// Optional strings for the [fieldLabelText] to override the default text.
  final String? fieldLabelText;

  /// Optional strings for the [fieldHintText] to override the default text.
  final String? fieldHintText;

  /// Optional strings for the [errorFormatText] to override the default text.
  final String? errorFormatText;

  /// Optional strings for the [errorInvalidText] to override the default text.
  final String? errorInvalidText;

  /// An optional [textDirection] argument can be used to set the text direction
  /// ([TextDirection.ltr] or [TextDirection.rtl]) for the date picker. It
  /// defaults to the ambient text direction provided by [Directionality]. If both
  /// [locale] and [textDirection] are non-null, [textDirection] overrides the
  /// direction chosen for the [locale].
  final TextDirection? textDirection;

  /// An optional [locale] argument can be used to set the locale for the date
  /// picker. It defaults to the ambient locale provided by [Localizations].
  final Locale? locale;

  /// The [context], [useRootNavigator] and [routeSettings] arguments are passed to
  /// [showDialog], the documentation for which discusses how it is used. [context]
  /// and [useRootNavigator] must be non-null.
  final bool useRootNavigator;

  /// Creates data used to construct routes.
  final RouteSettings? routeSettings;

  /// An optional [initialEntryMode] argument can be used to display the date
  /// picker in the [DatePickerEntryMode.calendar] (a calendar month grid)
  /// or [DatePickerEntryMode.input] (a text input field) mode.
  /// It defaults to [DatePickerEntryMode.calendar] and must be non-null.
  final DatePickerEntryMode? initialEntryMode;

  /// An optional [initialDatePickerMode] argument can be used to have the
  /// calendar date picker initially appear in the [DatePickerMode.year] or
  /// [DatePickerMode.day] mode. It defaults to [DatePickerMode.day], and
  /// must be non-null.
  final DatePickerMode? initialDatePickerMode;

  /// An optional [selectableDayPredicate] function can be passed in to only allow
  /// certain days for selection. If provided, only the days that
  /// [selectableDayPredicate] returns true for will be selectable. For example,
  /// this can be used to only allow weekdays for selection. If provided, it must
  /// return true for [initialDate].
  final bool Function(DateTime)? selectableDayPredicate;

  /// Show a dialog with time unconditionally displayed in 24 hour format.
  final bool use24HourFormat;

  /// The width for time text field when DateTimePickerType is dateTimeSeparated.
  final double? timeFieldWidth;

  final bool timePickerEntryModeInput;

  final ValueChanged<String>? onChanged;

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends FormFieldState<String> {
  TextEditingController? _stateController;
  final TextEditingController _dateLabelController = TextEditingController();
  final TextEditingController _timeLabelController = TextEditingController();
  DateTime _dDate = DateTime.now();
  TimeOfDay _tTime = TimeOfDay.now();
  String _sValue = '';
  String _sDate = '';
  String _sTime = '';
  String _sPeriod = '';

  @override
  TaskManagerDateTime get widget => super.widget as TaskManagerDateTime;

  TextEditingController? get _effectiveController =>
      widget.controller ?? _stateController;

  @override
  void initState() {
    super.initState();

    if (widget.controller == null) {
      _stateController = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller?.addListener(_handleControllerChanged);
    }

    initValues();
  }

  void initValues() {
    _dDate = widget.initialDate ?? DateTime.now();
    _tTime = widget.initialTime ?? TimeOfDay.now();

    final lsValue = _effectiveController?.text.trim();
    final languageCode = widget.locale?.languageCode;

    if (lsValue != null && lsValue != '' && lsValue != 'null') {
      if (widget.type != TaskManagerDateTimePickerType.time) {
        _dDate = DateTime.tryParse(lsValue) ?? DateTime.now();
        _tTime = TimeOfDay.fromDateTime(_dDate);
        _sDate = DateFormat('yyyy-MM-dd', languageCode).format(_dDate);
        _sTime = DateFormat('HH:mm', languageCode).format(_dDate);

        if (!widget.use24HourFormat) {
          _sTime = DateFormat('hh:mm a', languageCode).format(_dDate);
        }

        _timeLabelController.text = _sTime;
        _dateLabelController.text = _sDate;

        if (widget.dateMask != null && widget.dateMask != '') {
          _dateLabelController.text =
              DateFormat(widget.dateMask, languageCode).format(_dDate);
        } else {
          String lsMask = 'MMM d, yyyy';

          if (widget.type == TaskManagerDateTimePickerType.dateTime &&
              _sTime != '') {
            lsMask = 'MMM d, yyyy - HH:mm';

            if (!widget.use24HourFormat) {
              lsMask = 'MMM d, yyyy - hh:mm a';
            }
          }

          _dateLabelController.text =
              DateFormat(lsMask, languageCode).format(_dDate);
        }
      } else {
        final llTime = lsValue.split(':');
        _tTime =
            TimeOfDay(hour: int.parse(llTime[0]), minute: int.parse(llTime[1]));
        _sTime = lsValue;

        if (!widget.use24HourFormat) {
          _sPeriod = _tTime.period.index == 0 ? ' AM' : ' PM';
        }

        _timeLabelController.text = _sTime + _sPeriod;
      }
    }
  }

  @override
  void didUpdateWidget(TaskManagerDateTime oldWidget) {
    super.didUpdateWidget(oldWidget);
    final languageCode = widget.locale?.languageCode;

    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _stateController =
            TextEditingController.fromValue(oldWidget.controller?.value);
      }

      if (widget.controller != null) {
        setValue(widget.controller?.text);

        if (oldWidget.controller == null) {
          _stateController = null;
        }
      }
    }

    if (_effectiveController?.text != null &&
        _effectiveController?.text != '') {
      final lsValue = _effectiveController?.text.trim();

      if (lsValue != null && lsValue != '' && lsValue != 'null') {
        if (widget.type != TaskManagerDateTimePickerType.time) {
          final lsOldDate = _sDate;
          final lsOldTime = _sTime;
          _dDate = DateTime.tryParse(lsValue) ?? DateTime.now();

          _sDate = DateFormat('yyyy-MM-dd', languageCode).format(_dDate);

          if (lsOldTime != '') {
            _tTime = TimeOfDay.fromDateTime(_dDate);
            _sTime = DateFormat('HH:mm', languageCode).format(_dDate);

            if (!widget.use24HourFormat) {
              _sTime = DateFormat('hh:mm a', languageCode).format(_dDate);
            }
          }

          _dateLabelController.text = lsOldDate != '' ? _sDate : '';
          _timeLabelController.text = lsOldTime != '' ? _sTime : '';

          if (widget.dateMask != null && widget.dateMask != '') {
            _dateLabelController.text =
                DateFormat(widget.dateMask, languageCode).format(_dDate);
          } else {
            String lsMask = 'MMM d, yyyy';

            if (widget.type == TaskManagerDateTimePickerType.dateTime &&
                _sTime != '') {
              lsMask = 'MMM d, yyyy - HH:mm';

              if (!widget.use24HourFormat) {
                lsMask = 'MMM d, yyyy - hh:mm a';
              }
            }

            _dateLabelController.text =
                DateFormat(lsMask, languageCode).format(_dDate);
          }
        } else {
          final llTime = lsValue.split(':');
          _tTime = TimeOfDay(
              hour: int.parse(llTime[0]), minute: int.parse(llTime[1]));
          _sTime = lsValue;
          _timeLabelController.text = _sTime + _sPeriod;
        }
      }
    } else {
      _dateLabelController.clear();
      _timeLabelController.clear();

      initValues();
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);

    super.dispose();
  }

  @override
  void reset() {
    super.reset();

    setState(() {
      _effectiveController?.text = widget.initialValue ?? '';
    });
  }

  void _handleControllerChanged() {
    if (_effectiveController?.text != value) {
      didChange(_effectiveController?.text);
    }
  }

  void onChangedHandler(String value) {
    widget.onChanged?.call(value);

    didChange(value);
  }

  Future<void> _showDatePickerDialog() async {
    final ldDatePicked = await showDatePicker(
      context: context,
      initialDate: _dDate,
      firstDate: widget.firstDate ?? DateTime.now(),
      lastDate: widget.lastDate ?? DateTime.now(),
      helpText: widget.calendarTitle,
      cancelText: widget.cancelText,
      confirmText: widget.confirmText,
      initialDatePickerMode: widget.initialDatePickerMode ?? DatePickerMode.day,
      initialEntryMode: widget.initialEntryMode ?? DatePickerEntryMode.calendar,
      selectableDayPredicate: widget.selectableDayPredicate,
      fieldLabelText: widget.fieldLabelText,
      fieldHintText: widget.fieldHintText,
      errorFormatText: widget.errorFormatText,
      errorInvalidText: widget.errorInvalidText,
      //textDirection: widget.textDirection,
      locale: widget.locale,
      useRootNavigator: widget.useRootNavigator,
      routeSettings: widget.routeSettings,
    );

    final languageCode = widget.locale?.languageCode;
    if (ldDatePicked != null) {
      _sDate = DateFormat('yyyy-MM-dd', languageCode).format(ldDatePicked);
      _dDate = ldDatePicked;
      final lsOldValue = _sValue;
      _sValue = _sDate;
      String lsFormatedDate;

      if (widget.dateMask != null && widget.dateMask != '') {
        lsFormatedDate = DateFormat(widget.dateMask, languageCode)
            .format(DateTime.tryParse(_sDate)!);
      } else {
        lsFormatedDate = DateFormat('MMM dd, yyyy', languageCode)
            .format(DateTime.tryParse(_sDate)!);
      }

      if (widget.type == TaskManagerDateTimePickerType.dateTimeSeparate &&
          _sTime != '') {
        _sValue = '$_sDate $_sTime';
      }

      _sValue = _sValue.trim();
      _dateLabelController.text = lsFormatedDate;
      _effectiveController?.text = _sValue;

      if (_sValue != lsOldValue) {
        onChangedHandler(_sValue);
      }
    }
  }

  void set12HourTimeValues(final TimeOfDay ptTimePicked) {
    final ldNow = DateTime.now();
    final ldTime = DateTime(ldNow.year, ldNow.month, ldNow.day,
        ptTimePicked.hour, ptTimePicked.minute);
    final lsHour = DateFormat("hh", widget.locale.toString()).format(ldTime);
    final lsMinute = DateFormat("mm", widget.locale.toString()).format(ldTime);

    _sTime = '$lsHour:$lsMinute';
    _sPeriod = ptTimePicked.period.index == 0 ? ' AM' : ' PM';
  }

  Future<void> _showTimePickerDialog() async {
    final ltTimePicked = await showTimePicker(
      context: context,
      initialTime: _tTime,
      initialEntryMode: widget.timePickerEntryModeInput
          ? TimePickerEntryMode.input
          : TimePickerEntryMode.dial,
      useRootNavigator: widget.useRootNavigator,
      routeSettings: widget.routeSettings,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(alwaysUse24HourFormat: widget.use24HourFormat),
          child: child ?? const SizedBox(),
        );
      },
    );

    if (ltTimePicked != null) {
      var lsHour = ltTimePicked.hour.toString().padLeft(2, '0');
      var lsMinute = ltTimePicked.minute.toString().padLeft(2, '0');

      if (ltTimePicked.period.index == 0 && lsHour == '12') {
        lsHour = '00';
      }

      if (!widget.use24HourFormat) {
        set12HourTimeValues(ltTimePicked);
      } else {
        _sTime = '$lsHour:$lsMinute';
      }

      _tTime = ltTimePicked;

      _timeLabelController.text = _sTime;
      final lsOldValue = _sValue;
      _sValue = _sTime;

      if (widget.type == TaskManagerDateTimePickerType.dateTimeSeparate &&
          _sDate != '') {
        _sValue = '$_sDate $_sTime';
      }

      _sValue = _sValue.trim();
      _effectiveController?.text = _sValue;

      if (_sValue != lsOldValue) {
        onChangedHandler(_sValue);
      }
    }
  }

  Future<void> _showDateTimePickerDialog() async {
    String lsFormatedDate;

    final ldDatePicked = await showDatePicker(
      context: context,
      initialDate: _dDate,
      firstDate: widget.firstDate ?? DateTime.now(),
      lastDate: widget.lastDate ?? DateTime.now(),
      helpText: widget.calendarTitle,
      cancelText: widget.cancelText,
      confirmText: widget.confirmText,
      initialDatePickerMode: widget.initialDatePickerMode ?? DatePickerMode.day,
      initialEntryMode: widget.initialEntryMode ?? DatePickerEntryMode.calendar,
      selectableDayPredicate: widget.selectableDayPredicate,
      fieldLabelText: widget.fieldLabelText,
      fieldHintText: widget.fieldHintText,
      errorFormatText: widget.errorFormatText,
      errorInvalidText: widget.errorInvalidText,
      //textDirection: widget.textDirection,
      locale: widget.locale,
      useRootNavigator: widget.useRootNavigator,
      routeSettings: widget.routeSettings,
    );

    final languageCode = widget.locale?.languageCode;
    if (ldDatePicked != null) {
      _sDate = DateFormat('yyyy-MM-dd', languageCode).format(ldDatePicked);
      _dDate = ldDatePicked;

      final ltTimePicked = await showTimePicker(
        context: context,
        initialTime: _tTime,
        initialEntryMode: widget.timePickerEntryModeInput
            ? TimePickerEntryMode.input
            : TimePickerEntryMode.dial,
        useRootNavigator: widget.useRootNavigator,
        routeSettings: widget.routeSettings,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(alwaysUse24HourFormat: widget.use24HourFormat),
            child: child ?? const SizedBox(),
          );
        },
      );

      if (ltTimePicked != null) {
        var lsHour = ltTimePicked.hour.toString().padLeft(2, '0');
        var lsMinute = ltTimePicked.minute.toString().padLeft(2, '0');

        if (ltTimePicked.period.index == 0 && lsHour == '12') {
          lsHour = '00';
        }

        if (!widget.use24HourFormat) {
          set12HourTimeValues(ltTimePicked);
        } else {
          _sTime = '$lsHour:$lsMinute';
        }

        _tTime = ltTimePicked;
      } else {
        var lsHour = _tTime.hour.toString().padLeft(2, '0');
        final lsMinute = _tTime.minute.toString().padLeft(2, '0');

        if (_tTime.period.index == 0 && lsHour == '12') {
          lsHour = '00';
        }

        if (!widget.use24HourFormat) {
          _sPeriod = _tTime.period.index == 0 ? ' AM' : ' PM';
        }

        _sTime = '$lsHour:$lsMinute';
      }

      final lsOldValue = _sValue;
      _sValue = '$_sDate $_sTime';
      _sValue = _sValue.trim();

      if (widget.dateMask != null && widget.dateMask != '') {
        lsFormatedDate = DateFormat(widget.dateMask, languageCode)
            .format(DateTime.tryParse(_sValue)!);
      } else {
        final lsMask = _sTime != '' ? 'MMM dd, yyyy - HH:mm' : 'MMM dd, yyyy';
        lsFormatedDate = DateFormat(lsMask, languageCode)
            .format(DateTime.tryParse(_sValue)!);
      }

      _dateLabelController.text = lsFormatedDate;
      _effectiveController?.text = _sValue;

      if (_sValue != lsOldValue) {
        onChangedHandler(_sValue);
      }
    }
  }
}
