import 'package:flutter/material.dart';

void main() {
  runApp(const TumaneenaApp());
}

class TumaneenaApp extends StatelessWidget {
  const TumaneenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'طُمَأْنِينَة',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
        fontFamily: 'sans-serif',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طُمَأْنِينَة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade800, Colors.teal.shade600],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    'أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'دليل الشاب المؤمن • أدعية، زيارات، ومناجيات',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              children: [
                _buildMenuCard(context, 'القرآن الكريم', Icons.menu_book_rounded, Colors.green, const QuranScreen()),
                _buildMenuCard(context, 'أوقات الصلاة', Icons.access_time_filled_rounded, Colors.amber.shade800, const PrayerTimesScreen()),
                _buildMenuCard(context, 'الأدعية والأذكار', Icons.menu_open_rounded, Colors.teal, const AzkarScreen()),
                _buildMenuCard(context, 'المناجيات الإلهية', Icons.volunteer_activism_rounded, Colors.indigo, const MunajatScreen()),
                _buildMenuCard(context, 'الزيارات الكاملة', Icons.mosque_rounded, Colors.brown, const ZeyaratScreen()),
                _buildMenuCard(context, 'فضائل المعصومين (ع)', Icons.auto_awesome_rounded, Colors.purple, const AhlulbaytVirtuesScreen()),
                _buildMenuCard(context, 'شرف المؤمن (صلاة الليل)', Icons.nights_stay_rounded, Colors.deepPurple, const SalatAlLaylScreen()),
                _buildMenuCard(context, 'المسبحة الإلكترونية', Icons.touch_app_rounded, Colors.blue, const TasabeehScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget targetScreen) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: color.withOpacity(0.12),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 1. شاشة القرآن الكريم
class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  final List<Map<String, String>> surahs = const [
    {'name': 'سورة الفاتحة', 'type': 'مكية', 'verses': '7 آيات'},
    {'name': 'سورة البقرة', 'type': 'مدنية', 'verses': '286 آية'},
    {'name': 'سورة آل عمران', 'type': 'مدنية', 'verses': '200 آية'},
    {'name': 'سورة النساء', 'type': 'مدنية', 'verses': '176 آية'},
    {'name': 'سورة المائدة', 'type': 'مدنية', 'verses': '120 آية'},
    {'name': 'سورة يس', 'type': 'مكية', 'verses': '83 آية'},
    {'name': 'سورة الواقعة', 'type': 'مكية', 'verses': '96 آية'},
    {'name': 'سورة الملك', 'type': 'مكية', 'verses': '30 آية'},
    {'name': 'سورة الإخلاص', 'type': 'مكية', 'verses': '4 آيات'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم'), backgroundColor: Colors.green),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: surahs.length,
        itemBuilder: (context, index) {
          final surah = surahs[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Text('${index + 1}', style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold)),
              ),
              title: Text(surah['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${surah['type']} • ${surah['verses']}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}

// 2. أوقات الصلاة الشرعية
class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أوقات الصلاة الشرعية'), backgroundColor: Colors.amber.shade800),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTimeTile('الفجر', '04:35 ص', Icons.wb_twilight),
            _buildTimeTile('الشروق', '06:02 ص', Icons.wb_sunny),
            _buildTimeTile('الظهر', '11:58 ص', Icons.sunny),
            _buildTimeTile('العصر', '03:20 م', Icons.wb_cloudy),
            _buildTimeTile('المغرب (الشرعي)', '06:22 م', Icons.nights_stay),
            _buildTimeTile('العشاء', '07:10 م', Icons.bedtime),
            _buildTimeTile('منتصف الليل الشرعي', '11:28 م', Icons.access_time),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeTile(String title, String time, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.amber.shade900),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(time, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
      ),
    );
  }
}

// 3. الأدعية والأذكار
class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأدعية والأذكار'), backgroundColor: Colors.teal),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTextCard('دعاء كميل', 'اللَّهُمَّ إِنِّي أَسْأَلُكَ بِرَحْمَتِكَ الَّتِي وَسِعَتْ كُلَّ شَيْءٍ، وَبِقُوَّتِكَ الَّتِي قَهَرْتَ بِهَا كُلَّ شَيْءٍ، وَخَضَعَ لَهَا كُلُّ شَيْءٍ، وَذَلَّ لَهَا كُلُّ شَيْءٍ...'),
          _buildTextCard('دعاء العهد', 'اللَّهُمَّ رَبَّ النُّورِ الْعَظِيمِ، وَرَبَّ الْكُرْسِيِّ الرَّفِيعِ، وَرَبَّ الْبَحْرِ الْمَسْجُورِ، وَمُنْزِلَ التَّوْرَاةِ وَالإنْجِيلِ وَالزَّبُورِ...'),
          _buildTextCard('دعاء التوسل', 'اللَّهُمَّ إِنِّي أَسْأَلُكَ وَأَتَوَجَّهُ إِلَيْكَ بِنَبِيِّكَ نَبِيِّ الرَّحْمَةِ مُحَمَّدٍ صَلَّى اللَّهُ عَلَيْهِ وَآلِهِ...'),
          _buildTextCard('دعاء الصباح', 'اللَّهُمَّ يَا مَنْ دَلَعَ لِسَانَ الصَّبَاحِ بِنُطْقِ تَبَلُّجِهِ، وَسَرَّحَ قِطَعَ اللَّيْلِ الْمُظْلِمِ بِغَاهِيَبِ تَلَجْلُجِهِ...'),
        ],
      ),
    );
  }
}

// 4. المناجيات الخمس عشرة
class MunajatScreen extends StatelessWidget {
  const MunajatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المناجيات الخمس عشرة'), backgroundColor: Colors.indigo),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTextCard('مناجاة التائبين', 'إِلهِي أَلْبَسَتْنِي الْخَطايا ثَوْبَ مَذَلَّتِي، وَجَلَّلَنِي التَّباُعُدُ مِنْكَ لِباسَ مَسْكَنَتِي، وَأَماتَ كَبِيرَ جِنايَتِي عَظِيمَ قَلْبِي...'),
          _buildTextCard('مناجاة الشاكين', 'إِلهِي إِلَيْكَ أَشْكُو نَفْساً بِالسُّوءِ أَمَّارَةً، وَإِلَى الْخَطِيئَةِ مُبادِرَةً، وَبِمَعاصِيكَ مُولَعَةً...'),
          _buildTextCard('مناجاة الخائفين', 'إِلهِي أَتَراني بَعْدَ الإِيْمانِ بِكَ تُعَذِّبُنِي، أَمْ بَعْدَ حُبِّي إِيَّاكَ تُبَعِّدُنِي...'),
          _buildTextCard('مناجاة الذاكرين', 'إِلهِي لَوْلا الْواجِبُ مِنْ قَبُولِ أَمْرِكَ لَنَزَّهْتُكِ مِنْ ذِكْرِي إِيَّاكَ، عَلَى أَنَّ ذِكْرِي لَكَ بِقَدْرِي لا بِقَدْرِكَ...'),
        ],
      ),
    );
  }
}

// 5. الزيارات الكاملة
class ZeyaratScreen extends StatelessWidget {
  const ZeyaratScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الزيارات الشريفة'), backgroundColor: Colors.brown),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTextCard('زيارة عاشوراء', 'السَّلامُ عَلَيْكَ يَا أَبَا عَبْدِ اللَّهِ، السَّلامُ عَلَيْكَ يَا ابْنَ رَسُولِ اللَّهِ، السَّلامُ عَلَيْكَ يَا خِيَرَةَ اللَّهِ وَابْنَ خِيَرَتِهِ، السَّلامُ عَلَيْكَ يَا ابْنَ أَمِيرِ الْمُؤْمِنِينَ...'),
          _buildTextCard('زيارة أمين الله', 'السَّلامُ عَلَيْكَ يَا أَمِينَ اللَّهِ فِي أَرْضِهِ، وَحُجَّتَهُ عَلَى عِبَادِهِ، السَّلامُ عَلَيْكَ يَا أَمِيرَ الْمُؤْمِنِينَ، أَشْهَدُ أَنَّكَ جَاهَدْتَ فِي اللَّهِ حَقَّ جِهَادِهِ...'),
          _buildTextCard('زيارة آل ياسين', 'سَلامٌ عَلَى آلِ يس، السَّلامُ عَلَيْكَ يَا دَاعِيَ اللَّهِ وَرَبَّانِيَّ آيَاتِهِ، السَّلامُ عَلَيْكَ يَا بَابَ اللَّهِ وَدَيَّانَ دِينِهِ...'),
          _buildTextCard('زيارة الجامعة الكبيرة', 'سَلامٌ عَلَى أَوْلِيَاءِ اللَّهِ وَأَصْفِيَائِهِ، السَّلامُ عَلَيْكَ يَا أَمَنَةَ اللَّهِ فِي بِلاَدِهِ وَحُجَجَهُ عَلَى عِبَادِهِ...'),
        ],
      ),
    );
  }
}

// 6. فضائل المعصومين (ع) - 10 فضائل لكل معصوم
class AhlulbaytVirtuesScreen extends StatelessWidget {
  const AhlulbaytVirtuesScreen({super.key});

  final List<Map<String, dynamic>> virtuesData = const [
    {
      'title': 'رسول الله محمد (صلّى الله عليه وآله)',
      'virtues': [
        '1. خاتم النبيين والمرسلين وأشرف الخلق أجمعين.',
        '2. صاحب الخُلُق العظيم وشهد له القران الكريم بذلك.',
        '3. صاحب شفاعة يوم القيامة للجميع.',
        '4. أُرسِل رحمة للعالمين بشيراً ونذيراً.',
        '5. المعجزة الخالدة: القرآن الكريم.',
        '6. العروج إلى السماء في حادثة الإسراء والمعراج.',
        '7. تأسيس دولة الإسلام العدالة والمواطنة.',
        '8. كسر الأصنام وتطهير الكعبة المشرفة.',
        '9. مؤاخاة المسلمين وإرساء قواعد الأخوة.',
        '10. إبلاغ ولاية أمير المؤمنين (ع) في غدير خم.'
      ]
    },
    {
      'title': 'الإمام علي بن أبي طالب (عليه السلام)',
      'virtues': [
        '1. وليد الكعبة المشرفة ولم يولد فيها غيره.',
        '2. أول من آمن بالرسول (ص) وصلّى معه.',
        '3. المبيت في فراش النبي (ص) ليلة الهجرة (الفداء).',
        '4. قائد وشجاع بدر وأحد وحنين وخيبر.',
        '5. قسيم الجنة والنار وصاحب لواء الحمد.',
        '6. بواب مدينة علم الرسول (ص).',
        '7. الأخ والوصي والخليفة الشرعي يوم الغدير.',
        '8. التصدق بالخاتم أثناء الركوع ونزول الآية فيه.',
        '9. الزهد التام وعدم الانغماس في الدنيا.',
        '10. كافل الأيتام والمساكين في المشرق والمغرب.'
      ]
    },
    {
      'title': 'السيدة فاطمة الزهراء (عليها السلام)',
      'virtues': [
        '1. سيدة نساء العالمين من الأولين والآخرين.',
        '2. أم أبيها وبضعة النبي المصطفى (ص).',
        '3. نزول سورة الكوثر في فضلها ومكانتها.',
        '4. رضا الله من رضاها وغضبه من غضبها.',
        '5. سيدة أصحاب الكساء ومحور طهارتهم.',
        '6. التسبيح المنسوب باسمها (تسبيح الزهراء).',
        '7. الصبر والجهاد للدفاع عن الولاية.',
        '8. إيثار الفقراء والمساكين وطعامهم 3 أيام.',
        '9. شفاعتها العظمى لمحبيها يوم القيامة.',
        '10. الكفوء الوحيد لأمير المؤمنين (ع).'
      ]
    },
    {
      'title': 'الإمام الحسن المجتبى (عليه السلام)',
      'virtues': [
        '1. سبط النبي الأكبر وسيد شباب أهل الجنة.',
        '2. أشباه الناس برسول الله خلقاً وخُلُقاً.',
        '3. كريم أهل البيت لكثرة إنفاقه على الفقراء.',
        '4. خرج من ماله مرتين وقاسم الله ماله ثلاث مرات.',
        '5. صلح الحديبي الثاني (صلح الهدنة) لحفظ دماء المسلمين.',
        '6. حليم آل محمد في التعامل مع المسيء.',
        '7. شجاعته الفائقة في معارك الجمل وصفين.',
        '8. إفشال مخططات النفاق ببصيرته العالية.',
        '9. إمام قام أو قعد بنص الرسول (ص).',
        '10. إعمار مجلس العلم والتفسير في المدينة.'
      ]
    },
    {
      'title': 'الإمام الحسين الشهيد (عليه السلام)',
      'virtues': [
        '1. سيد شباب أهل الجنة وسبط الرحمة.',
        '2. "حسين مني وأنا من حسين" نص نبوي مبارك.',
        '3. مصباح الهدى وسفينة النجاة.',
         me '4. القائد والرمز الأول لرفض الظلم والفساد.',
        '5. الشفاء في تربته والتجابة الدعاء تحت قبته.',
        '6. الأئمة من ذريته بنص الرسول (ص).',
        '7. التضحية بالنفس والأهل لحفظ الدين.',
        '8. نهضة كربلاء الملهمة لكل أحرار العالم.',
        '9. البكاء عليه يوجب غفران الذنوب.',
        '10. باب الحوائج العظيم لكل مكروب.'
      ]
    },
    {
      'title': 'الإمام علي بن الحسين السجاد (عليه السلام)',
      'virtues': [
        '1. زين العابدين وسيد الساجدين.',
        '2. صاحب الصحيفة السجادية (زبور آل محمد).',
        '3. رسالة الحقوق التي أسست لحقوق الإنسان.',
        '4. كفالة مئات العوائل الفقيرة سراً في الليل.',
        '5. البكاء الصادق ونشر مظلومية عاشوراء.',
        '6. العبادة والتهجد الطويل حتى ورمت قدماه.',
        '7. الفصاحة والخطبة التاريخية في الشام.',
        '8. حلم وسعة صدر وعفو عند المقدرة.',
        '9. إعتاق العبيد وتربيتهم إسلامياً.',
        '10. حفظ امتداد الإمامة الإلهية بعد كربلاء.'
      ]
    },
    {
      'title': 'الإمام محمد بن علي الباقر (عليه السلام)',
      'virtues': [
        '1. باقر علوم النبيين وشاق العلم شقاً.',
        '2. إبلاغ سلام الرسول (ص) له عبر جابر الأنصاري.',
        '3. تأسيس الجامعة الإسلامية الكبرى بالمدينة.',
        '4. تربية الآلاف من الفقهاء والعلماء.',
        '5. نشر علوم الفقه والتفسير والكلام.',
        '6. الجود والكرم وإطعام الطعام.',
        '7. عبادته وخشوعه البالغ في محرابه.',
        '8. الشجاعة في إظهار الحق ومواجهة الانحراف.',
        '9. الحكمة في إدارة الأزمات والفتن.',
        '10. إحياء تراث أهل البيت وتوثيقه.'
      ]
    },
    {
      'title': 'الإمام جعفر بن محمد الصادق (عليه السلام)',
      'virtues': [
        '1. رئيس المذهب الجعفري وناشر علومه.',
        '2. تخرج على يديه 4000 عالم وفكير.',
        '3. إرساء قواعد الفقه والشريعة الإسلامية.',
        '4. مناظراته العلمية المنتصرة مع الفلاسفة.',
        '5. التواضع الشديد مع الفقراء وعامة الناس.',
        '6. الحث على زيارة الإمام الحسين (ع) وتأسيس الشعائر.',
        '7. الصدق والأمانة التي شهد لها الأعداء.',
        '8. اتساع الحركة العلمية في عهده.',
        '9. الأدعية والمناجيات الراقية المأثورة عنه.',
        '10. التصدق بالليل والسر على المستحقين.'
      ]
    },
    {
      'title': 'الإمام موسى بن جعفر الكاظم (عليه السلام)',
      'virtues': [
        '1. الكاظم للغيظ والعافي عن الناس.',
        '2. العبد الصالح وأعبد أهل زمانه.',
        '3. حليف السجدة الطويلة والدمعة الغزيرة.',
        '4. باب الحوائج إلى الله تعالى.',
        '5. الصبر العظيم في طوامير السجون.',
         me '6. تحويل السجن إلى محراب للعبادة والذكر.',
        '7. إنفاق الأموال وصِرار المطبخ المضروب بها المثل.',
        '8. هداية السجانين بأخلاقه وعبادته.',
        '9. العلم الواسع والرد على الشبهات.',
        '10. الحفاظ على التنظيم السري للشيعة.'
      ]
    },
    {
      'title': 'الإمام علي بن موسى الرضا (عليه السلام)',
      'virtues': [
        '1. عالم آل محمد بنص الآباء.',
        '2. غريب الغرباء والضامن للزوار.',
        '3. مناظراته الشهيرة مع رؤوس الأديان والملل.',
        '4. قبول ولاية العهد بفرضه لحقن دماء المؤمنين.',
        '5. صلاة العيد المشهورة التي هزت الخلافة.',
        '6. الأخلاق الرفيعة وعدم جرح مشاعر أحد.',
        '7. حديث سلسلة الذهب عن التوحيد والولاية.',
        '8. إكرام العلماء والشعراء (كدعبل الخزاعي).',
        '9. الرؤوفة بزوار مراقده الشريفة.',
        '10. نشر علوم ومظلومية أهل البيت في الخراسان.'
      ]
    },
    {
      'title': 'الإمام محمد بن علي الجواد (عليه السلام)',
      'virtues': [
        '1. باب المراد وجواد الأئمة.',
        '2. الإمامة المبكرة في سن السابعة بكفاءة إلهية.',
        '3. إفحام قاضي القضاة يحيى بن أكثم في المناظرة.',
        '4. الجود والسخاء الفائق على السائلين.',
        '5. العلم اللدنّي والرد على آلاف المسائل.',
        '6. الشجاعة والصلابة أمام ضغوط السلطة.',
        '7. الهيبة والوقار الهائل في صغر سنه.',
        '8. العبادة المستمرة والتعقيبات المباركة.',
        '9. الاهتمام بالشباب ورعايتهم علمياً.',
        '10. بركته العظيمة على الشيعة بنص الإمام الرضا (ع).'
      ]
    },
    {
      'title': 'الإمام علي بن محمد الهادي (عليه السلام)',
      'virtues': [
        '1. صاحب الزيارة الجامعة الكبيرة النورانية.',
        '2. النقي الهادي والدليل إلى الله.',
        '3. إفشال محاولات المتوكل العباسي لإهانته.',
        '4. استجابة الدعاء السريعة عند مرقده الشريف.',
        '5. إثبات الكرامات والمعاجز الظاهرة.',
        '6. إدارة شبكة الوكلاء بنجاح وحكمة.',
        '7. العبادة والزهد على حصير في غرفة خالية.',
        '8. الهيبة الإلهية التي تخضع لها القلوب.',
        '9. نشر التفسير والتوجيه العقائدي السليم.',
        '10. الصبر على الإقامة الجبرية في سامراء.'
      ]
    },
    {
      'title': 'الإمام الحسن بن علي العسكري (عليه السلام)',
      'virtues': [
        '1. والد الإمام المهدي المنتظر (عجل الله فرجه).',
        '2. الزكي والعسكري المرابط على الحق.',
        '3. التفسير المنسوب إليه والمليء بالحقائق.',
        '4. التمهيد لغيبة الإمام المهدي (عج).',
        '5. الصبر على المراقبة الشديدة في السجن.',
        '6. كرمه وإغناء الفقراء بكتابة الصكوك.',
        '7. خشوع العبادة التي أثرت في الحراس والسجانين.',
        '8. إفشال حيل الكندي الفيلسوف في تناقض القرآن.',
        '9. توجيه أتباعه بالالتزام بالورع والصدق.',
        '10. الجمال والهيبة والوقار النبوي.'
      ]
    },
    {
      'title': 'الإمام المهدي المنتظر (عجل الله فرجه)',
      'virtues': [
        '1. القائم بأمر الله والمنتقم لآل محمد.',
        '2. يملأ الأرض قسطاً وعدلاً كما ملئت ظلماً.',
        '3. صاحب العصمة والولاية التكوينية العظمى.',
        '4. بقية الله في أرضه والحجة الحية.',
        '5. خروج عيسى بن مريم (ع) والصلاة خلفه.',
        '6. توحيد العالم تحت راية التوحيد والعدل.',
        '7. إخراج كنز الأرض وعلوم الأنبياء.',
        '8. الدعاء للمؤمنين ورعايتهم في الغيبة.',
        '9. الشبيبة الخالدة عند ظهوره الشريف.',
        '10. تحقيق أمل الأنبياء والمرسلين طوال التاريخ.'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('10 فضائل لكل معصوم (ع)'), backgroundColor: Colors.purple),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: virtuesData.length,
        itemBuilder: (context, index) {
          final item = virtuesData[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossCrossAxisAlignment: CrossAxisAlignment.start,
                    children: (item['virtues'] as List<String>).map((v) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(v, style: const TextStyle(fontSize: 14, height: 1.4)),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// 7. قسم "شرف المؤمن" - صلاة الليل
class SalatAlLaylScreen extends StatelessWidget {
  const SalatAlLaylScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('شرف المؤمن (صلاة الليل)'), backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.shade200),
              ),
              child: const Column(
                children: [
                  Text('﴿ وَمِنَ اللَّيْلِ فَتَهَجَّدْ بِهِ نَافِلَةً لَّكَ عَسَىٰ أَن يَبْعَثَكَ رَبُّكَ مَقَامًا مَّحْمُودًا ﴾',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('أقوال وآثار صلاة الليل:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            const SizedBox(height: 8),
            _buildQuoteCard('عن رسول الله (ص):', '"شرف المؤمن صلاته بالليل، وعزه كف الأذى عن الناس".'),
            _buildQuoteCard('عن الإمام الصادق (ع):', '"صلاة الليل تبيض الوجه، وتذهب بالهم، وتجلب الرزق، وتحسن الخلق".'),
            _buildQuoteCard('عن أمير المؤمنين (ع):', '"قيام الليل مصحة للبدن، وموجبة لمرضاة الرب عز وجل".'),
            const SizedBox(height: 20),
            const Text('كيفية صلاة الليل (11 ركعة):', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
            const SizedBox(height: 10),
            _buildStepCard('1. نافلة الليل (8 ركعات)', 'تُصلى ركعتين ركعتين مثل صلاة الصبح، بنية نافلة الليل (4 مرات).'),
            _buildStepCard('2. ركعتا الشفع (ركعتان)', 'تُصلى ركعتين متصلتين، يقرأ في الأولى الفاتحة والناس، وفي الثانية الفاتحة والفلق (بدون قنوت).'),
            _buildStepCard('3. ركعة الوتر (ركعة واحدة)', 'تُصلى ركعة واحدة: الفاتحة ثم التوحيد (3 مرات) والمعوذتين، ثم القنوت الطويل والاستغفار 70 مرة والدعاء لـ 40 مؤمناً.'),
            _buildStepCard('💡 للمستعجل أو المتعب:', 'يمكن الاقتصار على الشفع والوتر فقط (3 ركعات)، أو ركعة الوتر وحدها عند ضيق الوقت قبل الفجر!'),
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteCard(String source, String text) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.format_quote, color: Colors.deepPurple),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(source, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(text, style: const TextStyle(fontSize: 14, height: 1.4)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard(String title, String desc) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
            const SizedBox(height: 6),
            Text(desc, style: const TextStyle(fontSize: 14, height: 1.5, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}

// 8. المسبحة الإلكترونية التفاعلية
class TasabeehScreen extends StatefulWidget {
  const TasabeehScreen({super.key});

  @override
  State<TasabeehScreen> createState() => _TasabeehScreenState();
}

class _TasabeehScreenState extends State<TasabeehScreen> {
  int _counter = 0;
  String _currentZikr = 'سُبْحَانَ اللَّهِ';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المسبحة الإلكترونية'), backgroundColor: Colors.blue),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentZikr,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                    items: <String>[
                      'سُبْحَانَ اللَّهِ',
                      'الْحَمْدُ لِلَّهِ',
                      'لا إِلَهَ إِلا اللَّهُ',
                      'اللَّهُ أَكْبَرُ',
                      'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ',
                      'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ'
                    ].map((String value) {
                      return DropdownMenuItem<String>(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _currentZikr = newValue!;
                        _counter = 0;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: _incrementCounter,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.blue, width: 6),
                    boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.2), blurRadius: 15, spreadRadius: 2)],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('$_counter', style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                        const SizedBox(height: 4),
                        const Text('اضغط للتسبيح', style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _resetCounter,
                icon: const Icon(Icons.refresh),
                label: const Text('تصفير العدّاد'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// بطاقة مخصصة للنصوص
Widget _buildTextCard(String title, String content) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.teal)),
          const Divider(),
          const SizedBox(height: 6),
          Text(content, style: const TextStyle(fontSize: 15, height: 1.6, color: Colors.black87)),
        ],
      ),
    );
  }