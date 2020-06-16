import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:uesc_hub/app/modules/schedule/components/realtime_widget.dart';
import 'package:uesc_hub/app/shared/functions/generation_date.dart';

import '../schedule_controller.dart';

class TimelineWidget extends StatelessWidget {
  final scheduleController = Modular.get<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineX: 0.3,
            isFirst: true,
            indicatorStyle: IndicatorStyle(
                width: 15,
                height: 15,
                indicator: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ) //_Sun(),
                ),
            topLineStyle: LineStyle(
              color: Theme.of(context).primaryColorLight,
            ),
            rightChild: _ContainerHeader(),
          ),
          _buildTimelineTile(
            context: context,
            indicator: const _IconIndicator(
              iconData: Icons.cloud,
              size: 20,
            ),
            hour: '18:00',
            weather: 'Cloudy',
            temperature: '26°C',
            phrase: 'A beautiful afternoon to take a walk into the park.'
                " Don't forget to take your water.",
          ),
          _buildTimelineTile(
            context: context,
            indicator: const _IconIndicator(
              iconData: Icons.wb_sunny,
              size: 20,
            ),
            hour: '20:00',
            weather: 'Sunset',
            temperature: '24°C',
            phrase: 'Enjoy the view, the sun will be back tomorrow.',
          ),
          _buildTimelineTile(
            context: context,
            indicator: const _IconIndicator(
              iconData: Icons.navigation,
              size: 20,
            ),
            hour: '22:00',
            weather: 'Fall of rain',
            temperature: '18°C',
            phrase: 'Temperature is decreasing...',
          ),
          _buildTimelineTile(
            context: context,
            indicator: const _IconIndicator(
              iconData: Icons.cloud_download,
              size: 20,
            ),
            hour: '00:00',
            weather: 'Chilly',
            temperature: '16°C',
            phrase: "Have a good night, don't forget your blanket.",
            isLast: true,
          ),
        ],
      );
    });
  }

  TimelineTile _buildTimelineTile({
    @required BuildContext context,
    _IconIndicator indicator,
    String hour,
    String weather,
    String temperature,
    String phrase,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineX: 0.3,
      topLineStyle: LineStyle(
        color: Theme.of(context).primaryColorLight,
      ),
      indicatorStyle: IndicatorStyle(
        indicatorY: 0.3,
        drawGap: true,
        width: 30,
        height: 30,
        indicator: indicator,
      ),
      isLast: isLast,
      leftChild: Center(
        child: Container(
          alignment: const Alignment(0.0, -0.50),
          child: Text(
            hour,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryTextTheme.bodyText2.color,
              // fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      rightChild: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              weather,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                // fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              temperature,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              phrase,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryTextTheme.bodyText2.color,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    Key key,
    this.iconData,
    this.size,
  }) : super(key: key);

  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // border: Border.all(
            //   color: Theme.of(context).accentColor,
            //   width: 2,
            // ),
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                iconData,
                size: size,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Sun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.yellow,
            blurRadius: 25,
            spreadRadius: 20,
          ),
        ],
        shape: BoxShape.circle,
        color: Colors.amber,
      ),
    );
  }
}

class _ContainerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Observer(builder: (_) {
              return RealTime();
            }),
            Text(
              GenerationDate(dateTime: DateTime.now()).getDay(),
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryTextTheme.bodyText1.color,
                // fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Humidity 40%',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      // fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  '30°C',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF4A448F).withOpacity(0.8),
                    // fontWeight: FontWeight.w800,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
