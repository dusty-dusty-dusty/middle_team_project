<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <header class="bg-white border-b"> -->
<header class='headerJSP'>
    <div class="max-w-[1920px] mx-auto px-6 h-16 flex items-center justify-between">
        <div class="flex items-center gap-8 font-bold ">
            <!-- <a href="#" class="text-xl font-['Pacifico'] text-gray-800"> -->
            <a href ='#' class = 'logo' ><img src='../resources/images/common/logo.png'/></a>
            <nav>
                <ul class="flex items-center gap-6">
                    <li><!-- <a href="#" class="text-gray-600 hover:text-primary"> --><a href="admin" >관리</a></li>
                    <li><!-- <a href="#" class="text-primary font-medium"> --><a href="admin_dashboard">대시보드</a></li>
                    <li><!-- <a href="#" class="text-gray-600 hover:text-primary"> --><a href="#">사용자 페이지</a></li>
                </ul>
            </nav>
        </div>
        <div class="flex items-center gap-4">
            <button class="w-10 h-10 rounded-full flex items-center justify-center hover:bg-gray-100">
                <i class="ri-notification-3-line text-gray-600"></i>
            </button>
            <div class="relative group">
                <button class="flex items-center gap-2 hover:bg-gray-100 py-2 px-3 rounded-full">
                    <div class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center">
                        <i class="ri-user-line text-gray-600"></i>
                    </div>
                    <span class="text-sm text-gray-700">관리자</span>
                    <i class="ri-arrow-down-s-line text-gray-600"></i>
                </button>
                <div class="absolute right-0 top-full mt-1 w-48 bg-white rounded-lg shadow-lg border opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200">
                    <ul class="py-2">
                        <li>
                            <a href="#" class="flex items-center gap-2 px-4 py-2 text-sm text-gray-700 hover:bg-gray-50">
                                <i class="ri-user-settings-line"></i>
                                <span>프로필 설정</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center gap-2 px-4 py-2 text-sm text-gray-700 hover:bg-gray-50">
                                <i class="ri-settings-4-line"></i>
                                <span>환경설정</span>
                            </a>
                        </li>
                        <li class="border-t">
                            <a href="#" class="flex items-center gap-2 px-4 py-2 text-sm text-red-600 hover:bg-gray-50">
                                <i class="ri-logout-box-r-line"></i>
                                <span>로그아웃</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>