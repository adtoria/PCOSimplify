import 'package:flutter/material.dart';
import 'leftArticleTile.dart';
import 'userClass.dart';
import 'addStory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'viewStory.dart';
import 'rightArticleTile.dart';

class Explorer extends StatefulWidget implements PreferredSizeWidget {
  Explorer({required this.height});
  final double height;

  @override
  State<Explorer> createState() => _ExplorerState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(height);
}

class _ExplorerState extends State<Explorer> {
  PageController pageViewController = PageController();

  Stream<List<User>> readData() => FirebaseFirestore.instance
      .collection('stories')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Widget buildUser(User user) => Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12, 7, 12, 7),
        child: ListTile(
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
            child: Text(
              user.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(
            'Written by - ' + user.name,
            style: TextStyle(fontSize: 15),
          ),
          //trailing: Text(user.timestamp),
          tileColor: Color(0xFFDDE3FD),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SeeStories(
                title: user.title,
                name: user.name,
                body: user.body,
              ),
            ),
          ),
          contentPadding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Color(0xFF595B82),
              width: 0.5,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: [
        //Page 0
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: _exploreOptionList(context),
              ),
              SizedBox(
                width: 260,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 12),
                  child: ListTile(
                    tileColor: Color(0xFF1E233C),
                    leading: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF1E233C),
                          size: 22,
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Text(
                        "Share Your Story",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPost(),
                      ),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                  ),
                ),
              ),
              StreamBuilder<List<User>>(
                stream: readData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    print("HI");
                    return Text('Something went wrong!');
                  } else if (snapshot.hasData) {
                    final users = snapshot.data!;

                    return Column(
                      children: users.map(buildUser).toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),

        //Page 1 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/pregnancy.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.healthline.com/health/pregnancy/pcos',
                            categoryName:
                                "What You Should Know About Polycystic Ovarian Syndrome (PCOS) and Pregnancy",
                            source: "healthline.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=SrrWW1LmNAs',
                            categoryName:
                                "How do women with PCOS get pregnant?",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.pregnancybirthbaby.org.au/pcos-and-pregnancy',
                            categoryName: "PCOS and pregnancy",
                            source: "pregnancybirthbaby.org.au",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://www.nichd.nih.gov/health/topics/pcos/more_information/FAQs/pregnancy',
                            categoryName: "Does PCOS affect pregnancy?",
                            source: "nichd.nih.gov",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=HPRq5y5NnRc',
                            categoryName:
                                "3 TIPS ON GETTING PREGNANT WITH PCOS",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.webmd.com/infertility-and-reproduction/polycystic-ovary-syndrome-fertility',
                            categoryName:
                                "PCOS and Your Fertility and What You Can Do About It",
                            source: "webmd.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=KW6gWv2gOa4',
                            categoryName:
                                "What happens if I have PCOS and I get pregnant?",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 2 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/pain.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.healthline.com/health/womens-health/ovarian-cyst-treatment-at-home',
                            categoryName:
                                "11 Home Treatments for Ovarian Cyst Symptoms",
                            source: "healthline.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=6dG5Qhuqa3I',
                            categoryName:
                                "Therapies for Endometriosis, PCOS, Period Pain",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.healthline.com/health/womens-health/what-does-ovarian-cyst-pain-feel-like',
                            categoryName:
                                "What Does Ovarian Cyst Pain Feel Like?",
                            source: "healthline.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=Dy6sYZXOWus',
                            categoryName:
                                "Endometriosis Why Pelvic pain should not be Ignored",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=SCgLamlP4Sw',
                            categoryName:
                                "Obstetrics and Gynecology – Pelvic Pain",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=qkIaToLO5U0',
                            categoryName: "YOGA FOR PCOS + PERIOD PAIN",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 3 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/acne.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.healthline.com/health/pcos-acne',
                            categoryName:
                                "Polycystic Ovary Syndrome (PCOS) and Acne: Connection, Treatment, and More",
                            source: "healthline.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=CCxp8SsiIbQ',
                            categoryName: "How I Got Rid of Acne & Facial Hair",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=htJg4A-7BQo',
                            categoryName: "PCOS & Skin | Dermatologist Review",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://www.health.harvard.edu/blog/polycystic-ovarian-syndrome-and-the-skin-2021042922502',
                            categoryName:
                                "Polycystic ovary syndrome and the skin",
                            source: "health.harvard.edu",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=nNYVPhzqnSU',
                            categoryName:
                                "How I Healed My Cystic Acne NATURALLY (PCOS & Hormonal Acne)",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.medicalnewstoday.com/articles/pcos-acne#pcos-and-acne',
                            categoryName: "What to know about PCOS and Acne",
                            source: "medicalnewstoday.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 4 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/guthealth.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://thepcosnutritionist.com/blog/pcos-and-gut-health/',
                            categoryName:
                                "Is Your Gut Bacteria The Secret To Your PCOS Weight Loss?",
                            source: "thepcosnutritionist.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=vLJvCTIcUVw',
                            categoryName:
                                "The best Probiotic foods to improve gut health",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=PWgLGhkfcM8',
                            categoryName: "PCOS Gut Health",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://apollosugar.com/world-of-diabetes/all-about-gut-health-in-pcos/',
                            categoryName: "All about gut health in PCOS",
                            source: "apollosugar.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=XD8jjQEeSc8',
                            categoryName:
                                "Gut Health: The SECRET to Looking and Feeling GREAT!",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://jilliangreaves.com/blog/2020/5/5/the-pcos-gut-health-connection',
                            categoryName: "The PCOS Gut Health Connection",
                            source: "jilliangreaves.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=dqA6LXNkgXE',
                            categoryName:
                                "Gut health and PCOS: 3 dietary strategies you should consider",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 5 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/stress.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.healthstatus.com/health_blog/pcos/7-ways-to-lower-stress-with-pcos/',
                            categoryName: "7 Ways To Lower Stress With PCOS",
                            source: "healthstatus.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=G_VE2OZrgNg',
                            categoryName:
                                "Stress in PCOS and its Effects on Fertility Potential",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=j_zWoGEqLbc',
                            categoryName:
                                "Mental health with Clinical Psychologist Ms. Seema Hingorrany",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://madeleineshaw.com/stress-and-pcos/',
                            categoryName: "Stress and PCOS",
                            source: "madeleineshaw.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=G87wihFwYXc',
                            categoryName: "PCOS and Cortisol",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.healthline.com/health/depression/pcos-and-depression#Does-PCOS-cause-depression?',
                            categoryName: "PCOS and Depression",
                            source: "Healthline.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=hJbRpHZr_d0',
                            categoryName: "Yoga for Anxiety and Stress",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 6 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/sleepmanagement.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=B5JKXyW6_sw',
                            categoryName: "Doctor's Prescription For PCOD",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.verywellhealth.com/pcos-and-sleep-disturbances-2616639',
                            categoryName: "Is PCOS Disturbing Your Sleep?",
                            source: "verywellhealth.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.hormones-australia.org.au/2019/09/13/sleep-disturbances-in-women-with-polycystic-ovary-syndrome-pcos/',
                            categoryName:
                                "Sleep disturbances in women with Polycystic Ovary Syndrome",
                            source: "hormones-australia.org.au",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://bebodywise.com/blog/pcos-sleep-hormones-affecting-sleep/',
                            categoryName:
                                "PCOS & Sleep | Hormones Affecting Sleep",
                            source: "bebodywise.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=2hCMrp11vio',
                            categoryName: "Sleep and PCOS",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.pennmedicine.org/updates/blogs/fertility-blog/2014/may/pcos-and-sleep-apnea',
                            categoryName: "PCOS and Sleep Apnea",
                            source: "pennmedicine.org",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=MnXWpoFrGa4',
                            categoryName:
                                "Why PCOS Kills Your Sleep & How You Can Fix It",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 7 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/period.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.northsidegynaecology.com.au/what-are-periods-like-when-you-have-pcos/',
                            categoryName:
                                "What are periods like when you have PCOS?",
                            source: "northsidegynaecology.com.au",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=MXi7mtC7AAk',
                            categoryName:
                                "PCOS Affects More Than Just Your Period: Two Women Share Their Stories | The Quint",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.verywellhealth.com/why-do-women-with-pcos-have-irregular-periods-2616650',
                            categoryName:
                                "Why Women with PCOS Have Irregular Periods",
                            source: "verywellhealth.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://www.jeanhailes.org.au/health-a-z/pcos/irregular-periods-management-treatment',
                            categoryName:
                                "Irregular periods - Management & Treatment",
                            source: "jeanhailes.org.au",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=3XW2I-M3-jc',
                            categoryName:
                                "What causes missed periods for months in PCOD patients and its management?",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://perlahealth.com/pcos-menstruation-ovulation/',
                            categoryName:
                                "How PCOS Can Affect Your Menstruation and Ovulation",
                            source: "perlahealth.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=RLTEyvwpaRg',
                            categoryName:
                                "How To Lose Weight & Get Periods Regularly!",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 8 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/hirsutism.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.medicalnewstoday.com/articles/182659#cosmetic-approaches',
                            categoryName: "What to know about Hirsutism",
                            source: "medicalnewstoday.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=ZY8rok_I-Ho',
                            categoryName:
                                "How to Manage Hirsutism if You Have PCOS",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.mayoclinic.org/diseases-conditions/hirsutism/symptoms-causes/syc-20354935',
                            categoryName: "Hirsutism",
                            source: "mayoclinic.org",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=KyJqZo6o0iM',
                            categoryName:
                                "Is it true mint helps in hair reduction in women with PCOS? - Dr. Chetali Samant",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=oB4xg75Edcs',
                            categoryName:
                                "What are the treatment options available to manage Hirsutism in PCOS",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.verywellhealth.com/hirsutism-in-women-with-pcos-2616644',
                            categoryName:
                                "Treating Hirsutism in Women With PCOS",
                            source: "verywellhealth.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=8J3KxaUNHZw',
                            categoryName:
                                "PCOS Facial Hair and Hair Loss | Causes, Treatments, & Natural Ways to Reduce Hirsutism & Hair Loss",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 9
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/transgender.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://helloclue.com/articles/cycle-a-z/what\'s-it-like-to-have-pcos-when-you\'re-trans',
                            categoryName:
                                "What it's like to have PCOS when you’re trans",
                            source: "helloclue.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.endocrine-abstracts.org/ea/0041/ea0041ep682',
                            categoryName:
                                "Polycystic ovary syndrome (Pcos) in female-to-male (Ftm) transsexual persons",
                            source: "endocrine-abstracts.org",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.gayparentstobe.com/gay-parenting-blog/pcos-and-lgbtqia/',
                            categoryName: "PCOS and the LGBTQIA+ Community",
                            source: "gayparentstobe.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=8UM9yVFu2lI',
                            categoryName:
                                "Case Discussion: PCOS Management in a Transgender Man",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.hysto.net/polycystic-ovarian-syndrome-transmen.htm',
                            categoryName:
                                "Polycystic Ovarian Syndrome and Trans Men: Is There a Link?",
                            source: "hysto.net",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=dRm9c2EOnXI',
                            categoryName: "FTM Transgender With PCOS",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=6KxaI1c92O0',
                            categoryName: "FTM Transgender With PCOS #2",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 10 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/diabetes.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://helloclue.com/articles/cycle-a-z/the-link-between-pcos-and-insulin-resistance',
                            categoryName:
                                "The link between PCOS and insulin resistance",
                            source: "helloclue.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=OjlWNvE7Qq8',
                            categoryName: "PCOS & Insulin Resistance | Maitri",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.verywellhealth.com/pcos-and-insulin-resistance-2616319',
                            categoryName: "Insulin Resistance and PCOS",
                            source: "verywellhealth.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=O_bhGDeOa_k',
                            categoryName:
                                "PCOS/PCOD Diet Science + Plan For Weight Loss | BeerBiceps Women's Health",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://www.healthline.com/health/diabetes/are-pcos-and-diabetes-connected',
                            categoryName:
                                "What’s the Connection Between Polycystic Ovarian Syndrome (PCOS) and Diabetes?",
                            source: "healthline.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=iVAraoiCjiw',
                            categoryName:
                                "PCOS/PCOD and Diabetes: What's the Link?",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.medicalnewstoday.com/articles/326185',
                            categoryName:
                                "What to know about PCOS and diabetes",
                            source: "medicalnewstoday.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Page 11 DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/workout.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.rmact.com/fertility-blog/pcos-fitness-guide',
                            categoryName:
                                "Best Workout for Managing PCOS Symptoms",
                            source: "rmact.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=4xrDxxg5jv4',
                            categoryName:
                                "5 Best Yoga Poses for PCOS Treatment",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.healthline.com/health/womens-health/exercise-for-pcos',
                            categoryName: "Best Exercises for PCOS",
                            source: "healthline.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=hNkqaMw8YCc',
                            categoryName: "Yoga for PCOS with Rashmi Ramesh",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://www.verywellhealth.com/setting-up-your-exercise-routine-2616476',
                            categoryName:
                                "Benefits of Exercising When You Have PCOS",
                            source: "verywellhealth.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.wellcurve.in/blog/yoga-poses-asanas-for-pcos/',
                            categoryName: "10 Yoga Poses for PCOS",
                            source: "wellcurve.in",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=Tkc2PP37c3U',
                            categoryName: "PCOS Workout with Sheba Devaraj",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        //Hairfall DONE
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: _exploreOptionList(context),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                child: Image(
                  image: AssetImage('assets/images/hairfall.png'),
                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LeftTiles(
                            articleUrl:
                                'https://www.womenshairlossproject.com/',
                            categoryName: "The Women's Hair Loss Project",
                            source: "womenshairlossproject.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=CCxp8SsiIbQ',
                            categoryName: "How I Got Rid of Acne & Facial Hair",
                            source: "youtube.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.healthline.com/health/pcos-hair-loss-2',
                            categoryName:
                                "How to Manage PCOS Related Hair Loss",
                            source: "Healthline.com",
                          ),
                          LeftTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=u1UY_MHFz2c',
                            categoryName: "PCOS Hair Loss Treatment",
                            source: "youtube.com",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RightTiles(
                            articleUrl:
                                'https://flo.health/pcos/pcos-hair-loss',
                            categoryName:
                                "PCOS Hair Loss: Effective Treatment Options for Hair Loss",
                            source: "flo.health",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.youtube.com/watch?v=dbY1LflgTl4',
                            categoryName:
                                "5 Haircare Secrets that MASSIVELY REDUCED MY PCOS Hairfall",
                            source: "youtube.com",
                          ),
                          RightTiles(
                            articleUrl:
                                'https://www.health.com/condition/pcos/pcos-hair-loss',
                            categoryName:
                                "PCOS and Hair Loss: Why It Happens and What to Do About It, According to Experts",
                            source: "health.com",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _exploreOptionList(BuildContext context) {
    return Container(
      height: 48.0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 10,
          ),
          _exploreTiles(
            title: 'Your Stories',
            context: context,
            index: 0,
          ),
          _exploreTiles(
            title: 'Pregnancy',
            context: context,
            index: 1,
          ),
          _exploreTiles(
            title: 'Pain',
            context: context,
            index: 2,
          ),
          _exploreTiles(
            title: 'Acne',
            context: context,
            index: 3,
          ),
          _exploreTiles(
            title: 'Gut Health',
            context: context,
            index: 4,
          ),
          _exploreTiles(
            title: 'Stress Management',
            context: context,
            index: 5,
          ),
          _exploreTiles(
            title: 'Sleep Management',
            context: context,
            index: 6,
          ),
          _exploreTiles(
            title: 'Periods',
            context: context,
            index: 7,
          ),
          _exploreTiles(
            title: 'Hirsutism',
            context: context,
            index: 8,
          ),
          _exploreTiles(
            title: 'Transgender',
            context: context,
            index: 9,
          ),
          _exploreTiles(
            title: 'Diabetes',
            context: context,
            index: 10,
          ),
          _exploreTiles(
            title: 'Workout',
            context: context,
            index: 11,
          ),
          _exploreTiles(
            title: 'Hairfall',
            context: context,
            index: 12,
          ),
        ],
      ),
    );
  }

  Widget _exploreTiles({
    required int index,
    required String title,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2.5, 0, 2.5, 0),
      child: GestureDetector(
        onTap: () {
          pageViewController.animateToPage(index,
              duration: Duration(milliseconds: 10), curve: Curves.linear);
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.only(right: 5),
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 38,
            decoration: BoxDecoration(
              color: Color(0xFF1E233C),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
