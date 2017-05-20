<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>${ta.trueName}的主页-信电校友录</title>
    <%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/portal-common/header.jsp" %>
<div class="container higher" id="container">
    <div class="pageheader">
        <h2>
            <i class="fa fa-user"></i> 个人中心 <span>${ta.trueName}的主页</span>
        </h2>
        <div class="breadcrumb-wrapper">
            <span class="label"></span>
            <ol class="breadcrumb">
                <li><a href="index.action">首页</a></li>
                <li class="active">个人中心</li>
            </ol>
        </div>
    </div>
    <div class="mb5"></div>
    <div class="row">
        <div class="col-sm-3">
            <img src="${ta.portrait}" class="thumbnail img-responsive" alt=""/>

            <div class="mb30"></div>

            <h5 class="subtitle">关于${ta.trueName}</h5>
            <p class="mb30">${ta.introduce}</p>

            <h5 class="subtitle">联系方式</h5>
            <ul class="profile-social-list">
                <li><i class="fa fa-qq"></i> <a href="javascript:;">twitter.com/eileensideways</a></li>
                <li><i class="fa fa-wechat"></i> <a href="javascript:;">facebook.com/eileen</a></li>
                <li><i class="fa fa-weibo"></i> <a href="javascript:;">youtube.com/eileen22</a></li>
                <li><i class="fa fa-linkedin"></i> <a href="javascript:;">linkedin.com/4ever-eileen</a></li>
            </ul>

            <div class="mb30"></div>

            <h5 class="subtitle">地址</h5>
            <address>
                云龙区 徐州工程学院中心校区<br>
                中国 江苏省 徐州市<br>
                <abbr title="电话">电话:</abbr> 18796253637
            </address>

        </div><!-- col-sm-3 -->
        <div class="col-sm-9">

            <div class="profile-header">
                <h2 class="profile-name">${ta.trueName}</h2>
                <div class="profile-location"><i class="fa fa-map-marker"></i> 江苏省 徐州市</div>
                <div class="profile-position"><i class="fa fa-briefcase"></i> 软件工程师 任职于 <a href="">东软.</a></div>
                
                <div class="mb20"></div>

                <button class="btn btn-success mr5"><i class="fa fa-user"></i> 关 注 </button>
                <button class="btn btn-white"><i class="fa fa-envelope-o"></i> 私 信 </button>
            </div><!-- profile-header -->

            <!-- Nav tabs -->
            <ul class="nav nav-tabs nav-justified nav-profile">
                <li class="active"><a href="#activities" data-toggle="tab"><strong>活动</strong></a></li>
                <li><a href="#followers" data-toggle="tab"><strong>关注TA的</strong></a></li>
                <li><a href="#following" data-toggle="tab"><strong>TA关注的</strong></a></li>
                <li><a href="#events" data-toggle="tab"><strong>TA的相关</strong></a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" id="activities">
                    <div class="activity-list">

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user1.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Ray Sin</strong> started following <strong>Eileen Sideways</strong>. <br/>
                                <small class="text-muted">Yesterday at 3:30pm</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/userprofile.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Eileen Sideways</strong> posted a new blog. <br/>
                                <small class="text-muted">Today at 3:18pm</small>

                                <div class="media blog-media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="images/photos/media5.png" alt=""/>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-title"><a href="">Ut Enim Ad Minim Veniam</a></h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor incididunt ut labore et dolore magna aliqua. Nostrud exercitation
                                            ullamco laboris nisi ut aliquip ex ea commodo consequat... <a href="">Read
                                                more</a></p>
                                    </div>
                                </div><!-- media -->

                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user2.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Chris Anthemum</strong> started following <strong>Eileen Sideways</strong>.
                                <br/>
                                <small class="text-muted">2 days ago at 8:30am</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/userprofile.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Eileen Sideways</strong> uploaded <a href="">5 photos</a>. <br/>
                                <small class="text-muted">5 days ago at 12:30pm</small>

                                <ul class="uploadphoto-list">
                                    <li><a href="images/photos/media1.jpg" data-rel="prettyPhoto"><img
                                            src="images/photos/media1.jpg" class="img-responsive" alt=""/></a></li>
                                    <li><a href="images/photos/media2.png" data-rel="prettyPhoto"><img
                                            src="images/photos/media2.png" class="img-responsive" alt=""/></a></li>
                                    <li><a href="images/photos/media3.png" data-rel="prettyPhoto"><img
                                            src="images/photos/media3.png" class="img-responsive" alt=""/></a></li>
                                </ul>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user4.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Frank Furter</strong> started following <strong>Eileen Sideways</strong>. <br/>
                                <small class="text-muted">6 days ago at 8:15am</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/userprofile.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Eileen Sideways</strong> posted a new note. <br/>
                                <small class="text-muted">6 days ago at 6:18am</small>
                                <h4 class="media-title"><a href="">Consectetur Adipisicing Elit</a></h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat... <a href="">Read
                                        more</a></p>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/userprofile.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Eileen Sideways</strong> posted a new blog. <br/>
                                <small class="text-muted">December 25 at 3:18pm</small>

                                <div class="media blog-media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="images/photos/media4.png" alt=""/>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-title"><a href="">Ut Enim Ad Minim Veniam</a></h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor incididunt ut labore et dolore magna aliqua. Nostrud exercitation
                                            ullamco laboris nisi ut aliquip ex ea commodo consequat... <a href="">Read
                                                more</a></p>
                                    </div>
                                </div><!-- media -->
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/userprofile.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Eileen Sideways</strong> added new photo. <br/>
                                <small class="text-muted">December 24 at 1:30pm</small>
                                <div class="mb20"></div>
                                <a href="images/photos/media6.png" data-rel="prettyPhoto" class="img-single"><img
                                        src="images/photos/media6.png" class="img-responsive" alt=""/></a>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user5.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Weno Carasbong</strong> started following <strong>Eileen Sideways</strong>.
                                <br/>
                                <small class="text-muted">December 15 at 3:30pm</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/userprofile.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Eileen Sideways</strong> posted a new blog. <br/>
                                <small class="text-muted">December 15 at 3:18pm</small>

                                <div class="media blog-media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="images/photos/media7.png" alt=""/>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-title"><a href="">Ut Enim Ad Minim Veniam</a></h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor incididunt ut labore et dolore magna aliqua. Nostrud exercitation
                                            ullamco laboris nisi ut aliquip ex ea commodo consequat... <a href="">Read
                                                more</a></p>
                                    </div>
                                </div><!-- media -->

                            </div>
                        </div><!-- media -->

                    </div><!-- activity-list -->

                    <button class="btn btn-white btn-block">Show More</button>

                </div>
                <div class="tab-pane" id="followers">

                    <div class="follower-list">

                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="holder.js/100x125.html" alt=""/>
                            </a>
                            <div class="media-body">
                                <h3 class="follower-name">Ray Sin</h3>
                                <div class="profile-location"><i class="fa fa-map-marker"></i> San Francisco,
                                    California, USA
                                </div>
                                <div class="profile-position"><i class="fa fa-briefcase"></i> Software Engineer at <a
                                        href="">SomeCompany, Inc.</a></div>

                                <div class="mb20"></div>

                                <button class="btn btn-sm btn-success mr5"><i class="fa fa-user"></i> Follow</button>
                                <button class="btn btn-sm btn-white"><i class="fa fa-envelope-o"></i> Message</button>
                            </div>
                        </div><!-- media -->

                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="holder.js/100x125.html" alt=""/>
                            </a>
                            <div class="media-body">
                                <h3 class="follower-name">Weno Carasbong</h3>
                                <div class="profile-location"><i class="fa fa-map-marker"></i> Cebu City, Philippines
                                </div>
                                <div class="profile-position"><i class="fa fa-briefcase"></i> Software Engineer at <a
                                        href="">ITCompany, Inc.</a></div>

                                <div class="mb20"></div>

                                <button class="btn btn-sm btn-primary mr5"><i class="fa fa-check"></i> Following
                                </button>
                                <button class="btn btn-sm btn-white"><i class="fa fa-envelope-o"></i> Message</button>
                            </div>
                        </div><!-- media -->

                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="holder.js/100x125.html" alt=""/>
                            </a>
                            <div class="media-body">
                                <h3 class="follower-name">Nusja Nawancali</h3>
                                <div class="profile-location"><i class="fa fa-map-marker"></i> Madrid, Spain</div>
                                <div class="profile-position"><i class="fa fa-briefcase"></i> CEO at <a href="">SomeCompany,
                                    Inc.</a></div>

                                <div class="mb20"></div>

                                <button class="btn btn-sm btn-success mr5"><i class="fa fa-user"></i> Follow</button>
                                <button class="btn btn-sm btn-white"><i class="fa fa-envelope-o"></i> Message</button>
                            </div>
                        </div><!-- media -->

                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="holder.js/100x125.html" alt=""/>
                            </a>
                            <div class="media-body">
                                <h3 class="follower-name">Zaham Sindilmaca</h3>
                                <div class="profile-location"><i class="fa fa-map-marker"></i> Bangkok, Thailand</div>
                                <div class="profile-position"><i class="fa fa-briefcase"></i> Java Developer at <a
                                        href="">ITCompany, Inc.</a></div>

                                <div class="mb20"></div>

                                <button class="btn btn-sm btn-primary mr5"><i class="fa fa-check"></i> Following
                                </button>
                                <button class="btn btn-sm btn-white"><i class="fa fa-envelope-o"></i> Message</button>
                            </div>
                        </div><!-- media -->

                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="holder.js/100x125.html" alt=""/>
                            </a>
                            <div class="media-body">
                                <h3 class="follower-name">Christopher Atam</h3>
                                <div class="profile-location"><i class="fa fa-map-marker"></i> Tokyo, Japan</div>
                                <div class="profile-position"><i class="fa fa-briefcase"></i> QA Engineer at <a href="">SomeCompany,
                                    Inc.</a></div>

                                <div class="mb20"></div>

                                <button class="btn btn-sm btn-success mr5"><i class="fa fa-user"></i> Follow</button>
                                <button class="btn btn-sm btn-white"><i class="fa fa-envelope-o"></i> Message</button>
                            </div>
                        </div><!-- media -->

                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="holder.js/100x125.html" alt=""/>
                            </a>
                            <div class="media-body">
                                <h3 class="follower-name">Venro Leonga</h3>
                                <div class="profile-location"><i class="fa fa-map-marker"></i> Paris, France</div>
                                <div class="profile-position"><i class="fa fa-briefcase"></i> UX Designer at <a href="">ITCompany,
                                    Inc.</a></div>

                                <div class="mb20"></div>

                                <button class="btn btn-sm btn-success mr5"><i class="fa fa-user"></i> Follow</button>
                                <button class="btn btn-sm btn-white"><i class="fa fa-envelope-o"></i> Message</button>
                            </div>
                        </div><!-- media -->

                    </div><!--follower-list -->

                </div>
                <div class="tab-pane" id="following">

                    <div class="activity-list">

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user2.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Chris Anthemum</strong> liked a photos<br/>
                                <small class="text-muted">Today at 12:30pm</small>

                                <ul class="uploadphoto-list">
                                    <li><a href="images/photos/media5.png" data-rel="prettyPhoto"><img
                                            src="images/photos/media5.png" class="img-responsive" alt=""/></a></li>
                                    <li><a href="images/photos/media4.png" data-rel="prettyPhoto"><img
                                            src="images/photos/media4.png" class="img-responsive" alt=""/></a></li>
                                </ul>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user1.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Ray Sin</strong> is now following to <strong>Chris Anthemum</strong>. <br/>
                                <small class="text-muted">Yesterday at 1:30pm</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user4.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Frank Furter</strong> is now following to <strong>Ray Sin</strong>. <br/>
                                <small class="text-muted">3 days ago at 1:30pm</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user2.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Chris Anthemum</strong> liked a photos<br/>
                                <small class="text-muted">5 days ago at 12:30pm</small>

                                <ul class="uploadphoto-list">
                                    <li><a href="images/photos/media6.png" data-rel="prettyPhoto"><img
                                            src="images/photos/media6.png" class="img-responsive" alt=""/></a></li>
                                    <li><a href="images/photos/media7.png" data-rel="prettyPhoto"><img
                                            src="images/photos/media7.png" class="img-responsive" alt=""/></a></li>
                                    <li><a href="images/photos/media2.png" data-rel="prettyPhoto"><img
                                            src="images/photos/media2.png" class="img-responsive" alt=""/></a></li>
                                </ul>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user1.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Nusja Nawancali</strong> is now following to <strong>Zaham Sindilmaca</strong>.
                                <br/>
                                <small class="text-muted">December 25 at 1:30pm</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user4.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Frank Furter</strong> is now following to <strong>Zaham Sindilmaca</strong>.
                                <br/>
                                <small class="text-muted">December 24 at 1:30pm</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user3.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Nusja NawanCali</strong> posted a new blog. <br/>
                                <small class="text-muted">December 23 at 3:18pm</small>

                                <div class="media blog-media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="images/photos/media3.png" alt=""/>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-title"><a href="">Ut Enim Ad Minim Veniam</a></h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor incididunt ut labore et dolore magna aliqua. Nostrud exercitation
                                            ullamco laboris nisi ut aliquip ex ea commodo consequat... <a href="">Read
                                                more</a></p>
                                    </div>
                                </div><!-- media -->

                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user4.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Mark Zonsion</strong> is now following to <strong>Weno Carasbong</strong>. <br/>
                                <small class="text-muted">December 23 at 1:30pm</small>
                            </div>
                        </div><!-- media -->

                        <div class="media act-media">
                            <a class="pull-left" href="#">
                                <img class="media-object act-thumb" src="images/photos/user4.png" alt=""/>
                            </a>
                            <div class="media-body act-media-body">
                                <strong>Frank Furter</strong> is now following to <strong>Weno Carasbong</strong>. <br/>
                                <small class="text-muted">December 20 at 4:30pm</small>
                            </div>
                        </div><!-- media -->

                    </div><!-- activity-list -->

                    <button class="btn btn-white btn-block">Show More</button>

                </div>
                <div class="tab-pane" id="events">
                    <div class="events">
                        <h5 class="subtitle">Upcoming Events</h5>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="holder.js/100x120.html" alt=""/>
                                    </a>
                                    <div class="media-body event-body">
                                        <h4 class="event-title"><a href="">Free Living Trust Seminar</a></h4>
                                        <small class="text-muted"><i class="fa fa-map-marker"></i> Silicon Valley, San
                                            Francisco, CA
                                        </small>
                                        <small class="text-muted"><i class="fa fa-calendar"></i> Sunday, January 15,
                                            2014 at 11:00am
                                        </small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor...</p>
                                    </div>
                                </div><!-- media -->
                            </div><!-- col-sm-6 -->

                            <div class="col-sm-6">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="holder.js/100x120.html" alt=""/>
                                    </a>
                                    <div class="media-body event-body">
                                        <h4 class="event-title"><a href="">Serious Games Seminar</a></h4>
                                        <small class="text-muted"><i class="fa fa-map-marker"></i> New York City</small>
                                        <small class="text-muted"><i class="fa fa-calendar"></i> Monday, January 14,
                                            2014 at 8:00am
                                        </small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor...</p>
                                    </div>
                                </div><!-- media -->
                            </div><!-- col-sm-6 -->

                            <div class="col-sm-6">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="holder.js/100x120.html" alt=""/>
                                    </a>
                                    <div class="media-body event-body">
                                        <h4 class="event-title"><a href="">Travel &amp; Adventure Show</a></h4>
                                        <small class="text-muted"><i class="fa fa-map-marker"></i> Los Angeles, CA
                                        </small>
                                        <small class="text-muted"><i class="fa fa-calendar"></i> Friday, January 12,
                                            2014 at 8:00am
                                        </small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor...</p>
                                    </div>
                                </div><!-- media -->
                            </div><!-- col-sm-6 -->

                            <div class="col-sm-6">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="holder.js/100x120.html" alt=""/>
                                    </a>
                                    <div class="media-body event-body">
                                        <h4 class="event-title"><a href="">Mobile Games Summit</a></h4>
                                        <small class="text-muted"><i class="fa fa-map-marker"></i> Bay Area, San
                                            Francisco
                                        </small>
                                        <small class="text-muted"><i class="fa fa-calendar"></i> Saturday, January 10,
                                            2014 at 8:00am
                                        </small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor...</p>
                                    </div>
                                </div><!-- media -->
                            </div><!-- col-sm-6 -->
                        </div>

                        <br/>

                        <h5 class="subtitle">Past Events</h5>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="holder.js/100x120.html" alt=""/>
                                    </a>
                                    <div class="media-body event-body">
                                        <h4 class="event-title"><a href="">Free Living Trust Seminar</a></h4>
                                        <small class="text-muted"><i class="fa fa-map-marker"></i> Silicon Valley, San
                                            Francisco, CA
                                        </small>
                                        <small class="text-muted"><i class="fa fa-calendar"></i> Sunday, January 15,
                                            2014 at 11:00am
                                        </small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor...</p>
                                    </div>
                                </div><!-- media -->
                            </div><!-- col-sm-6 -->

                            <div class="col-sm-6">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="holder.js/100x120.html" alt=""/>
                                    </a>
                                    <div class="media-body event-body">
                                        <h4 class="event-title"><a href="">Serious Games Seminar</a></h4>
                                        <small class="text-muted"><i class="fa fa-map-marker"></i> New York City</small>
                                        <small class="text-muted"><i class="fa fa-calendar"></i> Monday, January 14,
                                            2014 at 8:00am
                                        </small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor...</p>
                                    </div>
                                </div><!-- media -->
                            </div><!-- col-sm-6 -->

                            <div class="col-sm-6">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="holder.js/100x120.html" alt=""/>
                                    </a>
                                    <div class="media-body event-body">
                                        <h4 class="event-title"><a href="">Travel &amp; Adventure Show</a></h4>
                                        <small class="text-muted"><i class="fa fa-map-marker"></i> Los Angeles, CA
                                        </small>
                                        <small class="text-muted"><i class="fa fa-calendar"></i> Friday, January 12,
                                            2014 at 8:00am
                                        </small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor...</p>
                                    </div>
                                </div><!-- media -->
                            </div><!-- col-sm-6 -->

                            <div class="col-sm-6">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img class="media-object" src="holder.js/100x120.html" alt=""/>
                                    </a>
                                    <div class="media-body event-body">
                                        <h4 class="event-title"><a href="">Mobile Games Summit</a></h4>
                                        <small class="text-muted"><i class="fa fa-map-marker"></i> Bay Area, San
                                            Francisco
                                        </small>
                                        <small class="text-muted"><i class="fa fa-calendar"></i> Saturday, January 10,
                                            2014 at 8:00am
                                        </small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor...</p>
                                    </div>
                                </div><!-- media -->
                            </div><!-- col-sm-6 -->
                        </div>

                    </div><!-- events -->
                </div>
            </div><!-- tab-content -->

        </div><!-- col-sm-9 -->
    </div>
    <!-- row -->
</div>

<%@ include file="/WEB-INF/views/portal-common/footer.jsp" %>

</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp" %>
<script src="assets/script/ta/ta-index.js"></script>
</html>