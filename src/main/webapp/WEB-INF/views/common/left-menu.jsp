<%--
  Left Menu
  author: REX
  version: 1.0
  since: 2018.08.07
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.paasta.caas.dashboard.common.Constants" %>
<nav style="height: 90%;">
    <div class="scroll_style">
        <ul class="nav_1d caas_nav">
            <%--<li class="cur">--%>
            <li id="left-menu-clusters" onclick="procMovePage('<%= Constants.CAAS_BASE_URL %>/clusters/overview');">
                <dl>
                    <dt>
                        <div id="lnbimg19" class="lefticos">
                        </div>
                    </dt>
                    <dd>
                        <p>
                            Intro
                        </p>
                    </dd>
                </dl>
            </li>
            <%--<li onclick="location.href='caas_workloads.html'">--%>
            <li id="left-menu-workloads" onclick="procMovePage('<%= Constants.CAAS_BASE_URL %>/workloads/overview');">
                <dl>
                    <dt>
                        <div id="lnbimg17" class="">

                        </div>
                    </dt>
                    <dd>
                        <p>
                            Workloads
                        </p>
                    </dd>
                </dl>
            </li>
            <%--<li onclick="location.href='caas_services.html'">--%>
            <li id="left-menu-services" onclick="procMovePage('<%= Constants.CAAS_BASE_URL %>/services');">
                <dl>
                    <dt>
                        <div id="lnbimg18" class="">

                        </div>
                    </dt>
                    <dd>
                        <p>
                            Services
                        </p>
                    </dd>
                </dl>
            </li>
            <!--li>
                <dl>
                    <dt>
                        <div id="lnbimg19" class="">
                        </div>
                    </dt>
                    <dd>
                        <p>
                            Config
                        </p>
                    </dd>
                </dl>
            </li>
            <li>
                <dl>
                    <dt>
                        <div id="lnbimg20" class="">
                        </div>
                    </dt>
                    <dd>
                        <p>
                            Storage
                        </p>
                    </dd>
                </dl>
            </li-->
        </ul>
    </div>
</nav>
